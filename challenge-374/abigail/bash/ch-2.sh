#!/opt/homebrew/bin/bash

while read line
do    max=0
      for ((i = 1; i <= 9; i ++))
      do  copy=${line//[^$i]/ }              # Replace any non-i by a space
          if   [[ ! -z ${copy// } ]]         # If we have any non spaces,
          then set $copy                     # Split on white space
               for seq in $*                 # Iterate over the chunks
               do  if   [[ $seq -gt $max ]]  # Keep track of the largest value
                   then max=$seq
                   fi
               done
          fi
      done
      echo $max
done
