#!/opt/perl/bin/perl

use 5.042;

use strict;
use warnings;
no  warnings 'syntax';

while (my $line = <>) {
    $line =~ /([aeiou]+)
              (?{ my $x = $^N;
                  print $x, " " if $x =~ m!a! &&
                                   $x =~ m!e! &&
                                   $x =~ m!i! &&
                                   $x =~ m!o! &&
                                   $x =~ m!u! })
              (*FAIL)/x;
    print "\n";
}

__END__
