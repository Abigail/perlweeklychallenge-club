#!/opt/homebrew/bin/node
 
  require ('readline')
. createInterface ({input: process . stdin})
. on              ('line', line => {
      //
      // Find all sequences of the same digit, numify them,
      // then use reduce to find the maximum
      //
      console . log ([... line . matchAll (/([1-9])\1*/g)] .
                      map    (x => +x [0])                 .
                      reduce ((seq, max) => Math . max (seq, max), 0))
  })
