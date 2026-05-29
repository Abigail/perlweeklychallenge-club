#!/opt/homebrew/bin/python3

import sys
import re

for line in sys . stdin:
    #
    # Extract all sequences of the same digit from the string,
    # map them to integers, then find and print the maximum.
    #
    print (max (map (lambda x: int (x [0]),
                     re . findall (r'(([0-9])\2*)', line))))
