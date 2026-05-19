#!/opt/perl/bin/perl

use 5.042;

use strict;
use warnings;
no  warnings 'syntax';

while (my $line = <>) {
    my $max = 0;
    while ($line =~ /([1-9])\1*/gp) {
        #
        # Iterate over all the sequences of the same digit, 
        # remember to largest (in a numerical sense) seen.
        #
        $max = ${^MATCH} if ${^MATCH} > $max
    }
    say $max;
}

__END__
