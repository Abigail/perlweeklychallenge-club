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
# Run as: perl ch-1.pl < input-file
#

my $FILE = "/usr/share/dict/words";

#
# Find all anagrams of the word '$word1' in the file
# with name '$filename'. Exclude the word itself.
#
# We treat all characters as being separate. That is, 'Abo' and
# 'boa' will not be considered to be anagrams from each other.
#
sub find_anagrams ($filename, $word1) {
    my $canon1 = join "" => sort split // => $word1;
    open my $fh, "<", $filename or die "open: $!";
    while (my $word2 = <$fh>) {
        chomp $word2;
        my $canon2 = join "" => sort split // => $word2;
        say $word2 if $canon1 eq $canon2 && $word1 ne $word2;
    }
}

#
# Find the anagrams.
#
find_anagrams $FILE => s/\n//r while <>;


__END__
