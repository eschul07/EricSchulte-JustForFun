# n-Bit Gray Code Generator
This design sequentially generates an n-bit-wide, 2^n length sequence of gray code.

## How it works
1. Create two arrays of length 2^n: 'shift' and 'seq'
1. Initialize 'shift' with a 0 in Row 1 and a 1 in Row 2.
1. Initialize the remaining rows of 'shift' with the corresponding entries of [integer sequence A007814](https://oeis.org/A007814)
  1. (asdf)
