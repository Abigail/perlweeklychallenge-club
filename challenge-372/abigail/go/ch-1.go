package main

import (
    "fmt"
    "bufio"
    "os"
    "strings"
)

func main () {
    reader := bufio . NewReader (os . Stdin)
    for {
        text, err := reader . ReadString ('\n')
        if (err != nil) {
            break
        }
        
        text     = strings . ReplaceAll (text, "\"", "")  // Remove quotes
        text     = strings . ReplaceAll (text, "\n", "")  // Remove newline
        spaces  := strings . Count      (text, " ")       // Count spaces
        words   := strings . Fields     (text)            // Split into words
        gaps    := len (words) - 1                        // Nr of gaps

        per_gap := 0                                      // Calculate amount
        if gaps > 0 {                                     //   of spaces needed
            per_gap = spaces / gaps
        }
        end     := spaces - gaps * per_gap

        fmt . Printf ("\"")                               // Print quote
        for index, value := range (words) {
            fmt . Printf ("%s", value)                    // Print word
            max := end
            if index < len (words) - 1 {
                max = per_gap
            }
            for i := 0; i < max; i ++ {                   // Print gap,
                fmt . Printf (" ")                        //   space by space
            }
        }
        fmt . Printf ("\"\n")                             // Print quote
    }
}
