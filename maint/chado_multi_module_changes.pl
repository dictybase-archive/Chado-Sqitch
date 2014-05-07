package Chado::SqitchChange;

use Moose;
use Cwd;
use XML::Twig;
use App::Sqitch;
use App::Sqitch::Command;
use Archive::Extract;
use XML::LibXML;
use File::Temp;
use File::Spec::Functions;
use File::Path qw/make_path/;
use feature qw/say/;
use SQL::Translator;
use Graph::Directed;
use Carp::Always;
with 'MooseX::Getopt';

has sqitch_dir => (
    is      => 'rw',
    isa     => 'Str',
    default => sub { return getcwd() },
    documentation =>
        'Output folder where all changes will be written, default is current folder'
);

has location => (
    is  => 'rw',
    isa => 'Str',
    default =>
        'http://downloads.sourceforge.net/project/gmod/gmod/chado-1.11/chado-1.11.tar.gz',
    documentation =>
        'Location of chado download url, default is http://downloads.sourceforge.net/project/gmod/gmod/chado-1.11/chado-1.11.tar.gz',
);

sub execute {
    my ($self)  = @_;
    my $tmp_dir = File::Temp->newdir();
    my $tarball = $self->extra_argv;
    if (@$tarball) {    # given a tarball through command line
        my $archive = Archive::Extract->new(
            archive => $tarball->[0],
            type    => 'tgz'
        );
        $archive->extract( to => $tmp_dir ) or die $archive->error;
    }
    else {
        my $tmp_file = File::Temp->new;
        $tmp_file->print(
            $self->chado_content_from_remote( $self->location ) );
        my $archive = Archive::Extract->new(
            archive => $ARGV[0],
            type    => 'tgz'
        );
        $archive->extract( to => $tmp_dir ) or die $archive->error;
    }

    my @children = grep { $_->is_dir }
        Path::Class::Dir->new( $tmp_dir->dirname )->children;
    my $dom = XML::LibXML->load_xml( location =>
            $children[0]->file("chado-module-metadata.xml")->stringify );

    my $chado_folder = Path::Class::Dir->new( $children[0] );
    my $top_dir      = Path::Class::Dir->new( $self->sqitch_dir );
    $self->write_sqitch_plan( $top_dir->file("sqitch.plan") );
    my $plan_dir = $top_dir->subdir("plans");
    make_path( $plan_dir->stringify );
    my $sqitch = App::Sqitch->new( { top_dir => $top_dir, verbosity => 1 } );
    my $template_dir = $self->create_template_dir;
    $self->create_templates($template_dir);

    my $graph = Graph::Directed->new;
    my $modules;
NODE:
    for my $node ( $dom->findnodes("//module") ) {
        my $id = $node->getAttribute("id");
        next NODE if $id eq 'composite';
        say "node is $id";
        my $sqitch_content
            = $self->get_sqitch_content( $chado_folder, $node );
        my $args = [
            $id,                    "-n sql for $id chado module",
            "--template-directory", $template_dir,
            "--set",                "deploy_content=$sqitch_content->[0]",
            "--set",                "revert_content=$sqitch_content->[1]",
            "--set",                "verify_content=$sqitch_content->[2]"
        ];
        my $command = App::Sqitch::Command->load(
            {   sqitch  => $sqitch,
                command => 'add',
                config  => $sqitch->config,
                args    => $args
            }
        );
        $command->execute(@$args);

        if ( $node->exists("dependency") ) {
            for my $dep ( $node->findnodes("dependency") ) {
                my $name = $dep->getAttribute("to");
                if ( !$graph->has_edge( $name, $id ) ) {
                    $graph->add_edge( $name, $id );
                }
            }
        }

        $modules->{$id} = $node;
    }

    for my $id ( keys %$modules ) {
        say "going for fake $id";
        my $plan_file = $plan_dir->file( $id . ".plan" );
        $self->write_sqitch_plan($plan_file);
        my $module_dir  = File::Temp->newdir->dirname;
        my $temp_sqitch = App::Sqitch->new(
            {   top_dir   => Path::Class::Dir->new($module_dir),
                verbosity => 1,
                plan_file => $plan_file
            }
        );
        # ascending sort based on number of predecessors of every chado module
        # The one with less will go on top
        my @deps
            = map { $_->[0] }
            sort  { $a->[1] <=> $b->[1] }
            map { [ $_, scalar $graph->all_predecessors($_) ] }
            $graph->all_predecessors($id);
        for my $pre (@deps) {
            say "got pre $pre";
            my $sqitch_content
                = $self->get_sqitch_content( $chado_folder,
                $modules->{$pre} );
            my $args = [
                $pre,
                "-n sql for $pre chado module",
                "--template-directory",
                $template_dir,
                "--set",
                "deploy_content=$sqitch_content->[0]",
                "--set",
                "revert_content=$sqitch_content->[1]",
                "--set",
                "verify_content=$sqitch_content->[2]"
            ];

            my $command = App::Sqitch::Command->load(
                {   sqitch  => $temp_sqitch,
                    command => 'add',
                    config  => $temp_sqitch->config,
                    args    => $args
                }
            );
            $command->execute(@$args);
        }

        my $sqitch_content
            = $self->get_sqitch_content( $chado_folder, $modules->{$id} );
        my $args = [
            $id,                    "-n sql for $id chado module",
            "--template-directory", $template_dir,
            "--set",                "deploy_content=$sqitch_content->[0]",
            "--set",                "revert_content=$sqitch_content->[1]",
            "--set",                "verify_content=$sqitch_content->[2]"
        ];
        push @$args, "-r", $_ for @deps;
        my $command = App::Sqitch::Command->load(
            {   sqitch  => $temp_sqitch,
                command => 'add',
                config  => $temp_sqitch->config,
                args    => $args
            }
        );
        $command->execute(@$args);
    }
}

sub create_template_dir {
    my ($self) = @_;
    my $temp_dir = File::Temp->newdir->dirname;
    make_path( catfile( $temp_dir, $_ ) ) for qw/deploy revert verify/;
    return $temp_dir;
}

sub create_templates {
    my ( $self, $template_dir ) = @_;
    my $deploy_content = <<"DEPLOY";
-- Deploy chado module [% change %]

[% FOREACH r IN requires -%]
    -- requires [% r %]
[% END %]

BEGIN;

[% IF deploy_content %]
    [% deploy_content %]
[% END %]

COMMIT;
DEPLOY

    my $file = Path::Class::Dir->new($template_dir)->subdir("deploy")
        ->file("pg.tmpl")->openw;
    $file->print($deploy_content);
    $file->close;

    my $revert_content = <<"REVERT";
-- Revert chado module [% change %]

BEGIN;

[% IF revert_content %]
    [% revert_content %]
[% END %]

COMMIT;
REVERT

    $file = Path::Class::Dir->new($template_dir)->subdir("revert")
        ->file("pg.tmpl")->openw;
    $file->print($revert_content);
    $file->close;

    my $verify_content = <<"VERIFY";
-- Verify chado module [% change %]

[% IF verify_content %]
    [% verify_content %]
[% END %]

VERIFY

    $file = Path::Class::Dir->new($template_dir)->subdir("verify")
        ->file("pg.tmpl")->openw;
    $file->print($verify_content);
    $file->close;

}

sub write_sqitch_plan {
    my ( $self, $plan_file ) = @_;
    if ( !-e $plan_file ) {
        my $content = <<"CONTENT";
%syntax-version=1.0.0-b2
%project=dictybase
%uri=https://github.com/dictyBase/Chado-Sqitch

CONTENT
        my $output = $plan_file->openw;
        $output->print($content);
        $output->close;
    }
}

sub get_sqitch_content {
    my ( $self, $chado_folder, $node ) = @_;
    my ($sql_node) = $node->findnodes('source[@type="sql"]');
    my $path       = $sql_node->getAttribute("path");
    my $content    = $chado_folder->subdir("modules")->file($path)->slurp;

    my $tr = SQL::Translator->new( from => "PostgreSQL" );
    $tr->producer( sub { $self->produce_revert_content(@_) } )
        or die $tr->error;
    my $revert_content = $tr->translate( \$content ) or die $tr->error;

    $tr->producer( sub { $self->produce_verify_content(@_) } )
        or die $tr->error;
    my $verify_content = $tr->translate( \$content ) or die $tr->error;
    return [ $content, $revert_content, $verify_content ];
}

sub produce_revert_content {
    my ( $self, $tr ) = @_;
    my $schema = $tr->schema;
    my $output;
    for my $t ( $schema->get_tables ) {
        $output .= sprintf "DROP TABLE IF EXISTS %s CASCADE;\n", $t->name;
    }
    return $output;
}

sub produce_verify_content {
    my ( $self, $tr ) = @_;
    my $schema = $tr->schema;
    my $output;
    for my $t ( $schema->get_tables ) {
        $output
            .= sprintf
            "SELECT pg_catalog.has_table_privilege(%s%s%s,'select');\n",
            "'",
            $t->name, "'";
        for my $field ( $t->field_names ) {
            $output
                .= sprintf
                "SELECT pg_catalog.has_column_privilege(%s%s%s, %s%s%s, 'select');\n",
                "'", $t->name, "'", "'", $field, "'";
        }
    }
    return $output;
}

package main;
Chado::SqitchChange->new_with_options->execute();

=head1 NAME

chado_multi_module_changes.pl - Generate sqitch compatible plan file and changes for every chado modules

=head1 SYNOPSIS

 perl chado_multi_module_changes.pl --sqitch_dir myproject 

 perl chado_multi_module_changes.pl --sqitch_dir myproject  chado-1.11.tar.gz

=head1 DESCRIPTION

Given a chado distribution tarball(local or remote), generates individual sqitch changes and plan 
file for every chado module. The changes(deploy,revert and verify) are written in the given folder
(--sqitch_dir) under deploy,revert and verify respectively. The plans are written in the B<plans> subfolder
under the chado module name.

=head1 Why this script

The script was created to experiment working with multiple and custom plan files. The result did not work out as intended
as B<sqitch> only works with a single plan file for a individual project. So, currently it is here for
learning purposes.


