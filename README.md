# Assembly Language
This repository contains three simple loop programs written for x86_64 and AArch64 platforms. It is the start of my assembly journey. 

### Loop program
The first program prints "Loop" message n-times determined by the min and max constants:
```
Loop
Loop
Loop
Loop
Loop
Loop
Loop
Loop
Loop
Loop
```

### Loop2 program
The second program does almost the same, except it also prints the loop index:
```
Loop: 0
Loop: 1
Loop: 2
Loop: 3
Loop: 4
Loop: 5
Loop: 6
Loop: 7
Loop: 8
Loop: 9
```

### Table program
The third program prints the times tables from 1-12:
```
 1 x  1 =   1
 2 x  1 =   2
 3 x  1 =   3
 4 x  1 =   4
 5 x  1 =   5
 6 x  1 =   6
 7 x  1 =   7
 8 x  1 =   8
 9 x  1 =   9
10 x  1 =  10
11 x  1 =  11
12 x  1 =  12
-------------
 1 x  2 =   2
 2 x  2 =   4
 3 x  2 =   6
 4 x  2 =   8
 5 x  2 =  10

  ...lines snipped for space... 

11 x 12 = 132
-------------
 1 x 12 =  12
 2 x 12 =  24
 3 x 12 =  36
 4 x 12 =  48
 5 x 12 =  60
 6 x 12 =  72
 7 x 12 =  84
 8 x 12 =  96
 9 x 12 = 108
10 x 12 = 120
11 x 12 = 132
12 x 12 = 144
```

## x86_64
The x86_64 folder contains assembly code that uses [NASM](https://www.nasm.us/xdoc/2.11/html/nasmdoc1.html#section-1.1) syntax and Makefile for compiling all the files into executables.

## AArch64
The aarch64 folder contains assembly code which compiles under [GNU Assembler (gas/as)](https://sourceware.org/binutils/docs/as/)
