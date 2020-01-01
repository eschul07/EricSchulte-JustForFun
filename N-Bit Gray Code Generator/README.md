# n-Bit Gray Code Generator
This SystemVerilog design sequentially generates an n-bit wide, 2<sup>n</sup> length sequence of gray code.

Completed August, 2019.

## How it works
1. Create two arrays of length 2<sup>n</sup>: 'shift' and 'seq'
1. Initialize 'shift' with a 0 in Row 1 and a 1 in Row 2
1. Initialize the remaining rows of 'shift' with the corresponding entries of [integer sequence A007814](https://oeis.org/A007814)
    1. (Each entry of sequence A007814 maps to the bit position that changes on the corresponding gray code entry)
1. Beginning on Row 2 of 'seq': Shift a 1 into 'seq' by the amount of bit positions indicated by Row 1 of 'shift'
    1. (Repeat for remaining rows until 'seq' is full)
1. Bitwise XOR Row 2 of 'seq' with Row 1 of 'seq'
    1. (Repeat for remaining rows until 'seq' is full)
1. Output the kth row of 'seq' on each positive edge of the clock signal
