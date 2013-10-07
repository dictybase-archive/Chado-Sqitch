
package Chado::NoFuncs;

use strict;
use feature 'say';

use Carp;
use File::Slurp;
use File::Temp;
use Graph::Directed;
use Moose;
use namespace::autoclean;
use Path::Class::Dir;
use SVN::Client;
use Text::Trim;
use URI::URL;
use XML::Twig;
with 'MooseX::Getopt';

has output => (
    is            => 'rw',
    isa           => 'Str',
    default       => 'dicty.sql',
    required      => 1,
    documentation => 'Output file. Default dicty.sql'
);

has chado_svn => (
    is      => 'rw',
    isa     => 'Str',
    default => sub {
        my ($self) = @_;
        my $path   = File::Temp->newdir;
        my $svn    = SVN::Client->new
            or croak 'Something went wrong with initializing SVN checkout';
        say "Checking out SVN repo at " . $path;
        $svn->checkout( $self->_chado_svn_repo_url, $path, 'HEAD', 1 );
        return $path;
    },
    required => 1,
    lazy     => 1,
    documentation =>
        'Path to Chado SVN checkout folder. Default temp directory'
);

has _chado_svn_repo_url => (
    is      => 'rw',
    isa     => 'URI::URL',
    default => sub {
        return URI::URL->new(
            'https://gmod.svn.sourceforge.net/svnroot/gmod/schema/trunk/chado'
        );
    },
    lazy          => 1,
    documentation => 'Chado SVN repository URL'
);

sub run {
    my ($self) = @_;

    my $output_handler = IO::File->new( $self->output, 'w' );

    my $metadata_file
        = Path::Class::Dir->new( $self->chado_svn )
        ->file('chado-module-metadata.xml')
        or croak 'File not found!';
    say "Reading Chado metadata from $metadata_file";

    my $module_data = $self->parse_metadata($metadata_file);

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

    for my $module_id (@module_load_order) {
        my $module_desc_sql = $module_data->{modules_hash}->{$module_id};
        my $module_sql_file
            = $module_base_dir->file( $module_desc_sql->{sql_path} );

        my $text = read_file($module_sql_file);
        $output_handler->print( sprintf "%s\n", $text );
    }

    say "Output written to " . $self->output;
    $output_handler->close();

    return;
}

sub parse_metadata {
    my ( $self, $meta_file ) = @_;

    my $xml = XML::Twig->new();
    $xml->parsefile($meta_file);

    my ($modules_dir) = $xml->descendants(q"source[@type='dir']");
    $modules_dir &&= $modules_dir->att('path');

    my $graph = Graph::Directed->new();

    my $modules_hash;
    for my $module ( $xml->descendants('module') ) {
        my $module_id   = $module->att('id') or croak 'module with no id';
        my $module_desc = trim( $module->first_child('description')->text );
        my ($sql_path)  = $module->descendants(q"source[@type='sql']");
        $sql_path &&= $sql_path->att('path')
            or warn "$module_id does not have path to $module_id.sql";
        $modules_hash->{$module_id}
            = { desc => $module_desc, sql_path => $sql_path };

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
Chado::NoFuncs->new_with_options->run();

1;
