
package Chado::NoFuncs;

use strict;
use feature 'say';

use File::Slurp;
use Moose;
use namespace::autoclean;
with 'MooseX::Getopt';

has input => (
    is       => 'rw',
    isa      => 'Str',
    required => 1
);

sub run {
    my ($self) = @_;
    my @lines = read_file( $self->input );
    my $statement;
    for my $line (@lines) {
        if ( $line =~ m/(CREATE TABLE)/ and $line =~ m/\(/ ) {
            $statement = $statement . $line;
            next;
        }
        if ( $line =~ m/\);/ ) {
            $statement = $statement . ' ' . $line;
            say $statement;
			say '*********************';
            $statement = '';
            next;
        }
        $statement = $statement . ' ' . $line;
    }
}

1;

package main;
Chado::NoFuncs->new_with_options->run();
