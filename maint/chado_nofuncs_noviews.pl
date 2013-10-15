
package Chado::NoFuncs;

use strict;
use feature 'say';

use App::Sqitch;
use Carp;
use File::Slurp;
use File::Temp;
use Graph::Directed;
use IPC::Cmd qw/can_run run/;
use Moose;
use namespace::autoclean;
use Path::Class::Dir;
use Text::Trim;
use XML::Twig;
with 'MooseX::Getopt';

has output => (
    is            => 'rw',
    isa           => 'Str',
    default       => 'chado_stripped.sql',
    required      => 1,
    documentation => 'Output file. Default chado_stripped.sql'
);

has views => (
    is            => 'rw',
    isa           => 'Bool',
    default       => 0,
    lazy          => 1,
    documentation => 'Option to export SQL for views. Default 0'
);

has functions => (
    is            => 'rw',
    isa           => 'Bool',
    default       => 0,
    lazy          => 1,
    documentation => 'Option to export SQL for functions. Default 0'
);

has change => (
    is            => 'rw',
    isa           => 'Str',
    default       => 'chado',
    documentation => ''
);

=item chado_svn

=cut 

has chado_svn => (
    is      => 'rw',
    isa     => 'Str',
    default => sub {
        my ($self) = @_;
        my $path = File::Spec->tmpdir() . "/chado_svn";
        if ( can_run('svn') ) {
            say "Checking out SVN repo at " . $path;
            my $url = 'https://svn.code.sf.net/p/gmod/svn/schema/trunk/chado';
            my $cmd = sprintf "%s %s %s %s", 'svn', 'co', $url, $path;
            my ( $success, $error_code, $full_buf, $stdout_buf, $stderr_buf )
                = run( command => $cmd, verbose => 0 );
            if ( !$success ) {
                croak "Unable to run command: " . $stderr_buf;
            }
            return $path;
        }
        else {
            croak "svn client is not installed";
        }
    },
    required => 1,
    lazy     => 1,
    documentation =>
        'Path to Chado SVN checkout folder. Default temp directory'
);

=item

=cut 

sub execute {
    my ($self) = @_;

    my $sqitch = App::Sqitch->new;    # Sqitch object with default config
    my $cmd_args;
    $cmd_args->[0] = $self->change;
    $cmd_args->[1] = "-n \'Initial Chado SQL\'";

    my $command = App::Sqitch::Command->load(
        {   sqitch  => $sqitch,
            command => 'add',
            config  => $sqitch->config,
            args    => $cmd_args
        }
    );
    $command->execute( @{$cmd_args} );
    my $metadata_file
        = Path::Class::Dir->new( $self->chado_svn )
        ->file('chado-module-metadata.xml')
        or croak 'File not found!';
    say "Reading Chado metadata from $metadata_file";

    my $module_data = $self->parse_metadata($metadata_file);
    $self->write_sql( $sqitch, $module_data );

    return;

}

sub write_sql {
    my ( $self, $sqitch, $module_data ) = @_;

    my $deploy_file = Path::Class::Dir->new( $sqitch->deploy_dir )
        ->file( $self->change . ".sql" );
    my $revert_file = Path::Class::Dir->new( $sqitch->revert_dir )
        ->file( $self->change . ".sql" );
    say $deploy_file;

    my $output_handler = IO::File->new( $deploy_file, 'w' );

    say "Sorting modules as per load order";
    my @module_load_order;
    while ( my @root_modules
        = grep { $module_data->{dep_graph}->is_successorless_vertex($_) }
        $module_data->{dep_graph}->vertices )
    {
        unshift @module_load_order, @root_modules;
        $module_data->{dep_graph}->delete_vertex($_) for @root_modules;
    }

    my $module_base_dir = Path::Class::Dir->new( $self->chado_svn )
        ->subdir( $module_data->{modules_dir} );
    say "Modules directory - $module_base_dir";

    $output_handler->print("-- Deploy $self->change\n\nBEGIN;\n\n");
    for my $module_id (@module_load_order) {
        my $module_desc_sql  = $module_data->{modules_hash}->{$module_id};
        my $module_sql_files = $module_desc_sql->{sql_path};
        for my $module_sql_path ( @{$module_sql_files} ) {
            my $module_sql_file = $module_base_dir->file($module_sql_path);
            my $text            = read_file($module_sql_file);
            $output_handler->print( sprintf "%s\n", $text );
        }
    }
    $output_handler->print("\nCOMMIT;");

    say "Output written to " . $deploy_file;
    $output_handler->close();
    return;
}

=item parse_metadata

=cut

sub parse_metadata {
    my ( $self, $meta_file ) = @_;

    my $xml = XML::Twig->new();
    $xml->parsefile($meta_file);    # Parsing metadata to iterate over modules

    my ($modules_dir) = $xml->descendants(q"source[@type='dir']");
    $modules_dir &&= $modules_dir->att('path');

    my $graph = Graph::Directed->new();  # Graph to handle module dependencies

    my $modules_hash;
    for my $module ( $xml->descendants('module') ) {
        my $module_id = $module->att('id')
            or croak 'module with no id';    # Name of module
        my $module_desc = trim( $module->first_child('description')->text );

        my @sql_paths;    # An array to store relative paths to SQL files
        my ($sql_path) = $module->descendants(q"source[@type='sql']");
        $sql_path &&= $sql_path->att('path')
            or warn "$module_id does not have path to $module_id.sql";
        push @sql_paths, $sql_path;

        # Views are component of modules
        if ( $self->views ) {
            for my $view_component (
                $module->descendants(q"component[@type='views']") )
            {
                my $component_id = $view_component->att('id');
                my ($view_sql_path)
                    = $view_component->descendants(q"source[@type='sql']");
                $view_sql_path &&= $view_sql_path->att('path')
                    or warn
                    "$component_id does not have path to $module_id.sql";
                push @sql_paths, $view_sql_path;
            }
        }

        # Functions are component of modules
        if ( $self->functions ) {
            for my $func_component (
                $module->descendants(q"component[@type=~/(dbapi|code)/]") )
            {
                my $component_id = $func_component->att('id');
                my ($func_sql_path)
                    = $func_component->descendants(
                    q"source[@type=~/(sqlapi|plpgsql|sqli)/]");
                $func_sql_path &&= $func_sql_path->att('path')
                    or warn "$component_id does not have path to *.sql";
                push @sql_paths, $func_sql_path;
            }
        }

        $modules_hash->{$module_id}
            = { desc => $module_desc, sql_path => \@sql_paths };

        $graph->add_vertex($module_id);
        for my $dep_id ( map { $_->att('to') or die "no 'to' in dependency" }
            $module->descendants('dependency') )
        {
            next if $dep_id = $module_id;
            $graph->add_edge( $dep_id, $module_id );
        }

    }
    return {
        modules_dir  => $modules_dir,
        modules_hash => $modules_hash,
        dep_graph    => $graph
    };
}

1;

package main;
Chado::NoFuncs->new_with_options->execute();

1;
