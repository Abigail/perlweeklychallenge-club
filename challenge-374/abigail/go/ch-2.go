package main

import (
    "fmt"
    "bufio"
    "os"
    "regexp"
    "strconv"
)

func main () {
    reader := bufio . NewReader (os . Stdin)
    for {
        text, err := reader . ReadString ('\n')
        if (err != nil) {
            break
        }
        max := 0

        //
        // For all digits 1 .. 9, find sequences of strings of the digit,
        // by creating patterns 1+, .., 9+, and matching them against
        // the input. 
        //
        pat := make ([] rune, 2)
        pat [1] = '+'
        for i := '1'; i <= '9'; i ++ {
            pat [0] = i
            seqs := regexp . MustCompile (string (pat)) .
                             FindAllStringSubmatch (text, -1)
            for _, val := range (seqs) {
                //
                // Turn the match into a number, and compare against
                // max; keep the largest number
                //
                number, _ := strconv . Atoi (val [0])
                if number > max {
                    max = number
                }
            }
        }
        fmt . Printf ("%d\n", max)
    }
}
