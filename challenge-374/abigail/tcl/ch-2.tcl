#!/opt/homebrew/bin/tclsh

while {[gets stdin line] >= 0} {
    set max 0
    #
    # Put all matches in the array 'seqs'; note that both the
    # full match, and the capture will be put in the array.
    #
    set seqs [regexp -all -inline {([1-9])\1*} $line]

    #
    # Iterate over the array, skipping all the odd indices, as
    # we're only interested in the full match, not the capture
    #
    for {set i 0} {$i < [llength $seqs]} {incr i 2} {
        set seq [lindex $seqs $i]
        if {$seq > $max} {
            set max $seq
        }
    }
    puts $max
}
