#!/opt/homebrew/bin/gawk


#
# Loop over each line of input
#
{
    max = 0
    for (i = 1; i <= 9; i ++) {
        #
        # For each digit, replace any character which isn't that digit
        # by a space, then split on space. This gives us all the substrings
        # in the input string consisting of that sequences of that digit.
        # Keep track of the largest sequence (in numerical sense) seen
        #
        line = gensub ("[^" i "]+", " ", "g", $0)
        split (line, seqs)
        for (seq in seqs) {
            if (seqs [seq] > max) {
                max = seqs [seq]
            }
        }
    }
    print max
}
