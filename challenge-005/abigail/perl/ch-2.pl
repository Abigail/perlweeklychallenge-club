#!/opt/perl/bin/perl

use 5.032;

use strict;
use warnings;
no  warnings 'syntax';

use experimental 'signatures';
use experimental 'lexical_subs';

#
# See ../README.md
#

#
# Run as: perl ch-2.pl
#

my $FILE = "/usr/share/dict/words";

my %sequences;
my %seen;

open my $fh, "<", $FILE or die "open: $!";
while (my $word = <$fh>) {
    chomp $word;
    #
    # We treat all characters as being separate. That is, 'Abo' and
    # 'boa' will not be considered to be anagrams from each other.
    #
    my $canon = join "" => sort split // => $word;
    $sequences {$canon} ++;
}

#
# Find the sequence with the most anagrams; ties are broken by picking
# the sequence which comes first alphabetically.
#
my $max = 0;
my $max_sequence;
foreach my $sequence (keys %sequences) {
    if ($sequences {$sequence} >  $max ||
        $sequences {$sequence} == $max && $sequence lt $max_sequence) {
        $max = $sequences {$max_sequence = $sequence};
    }
}

say $max_sequence;

__END__
