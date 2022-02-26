.text
.global _start

min       =  1                         
max       = 13        
stdout    =  1   
sys_write = 64   
sys_exit  = 93


_start:
    mov     x19, min

mloop:
    mov     x18, min

    // print break line 
    adr     x1, line
    mov     x2, llen
    bl      print

iloop:
    bl      first    // get first number inserted
    bl      second   // get second number inserted
    bl      result   // get result number inserted

    // print line
    adr     x1, mltp
    mov     x2, mlen
    bl      print

    // inner loop
    add     x18, x18, 1
    cmp     x18, max
    b.ne    iloop

    // outer loop
    add     x19, x19, 1
    cmp     x19, max
    b.ne    mloop

    // exit 
    mov     x0, 0
    mov     x8, sys_exit
    svc     0

// Insert first number into the buffer
first:
    sub     sp, sp, 16
    str     x30, [sp]

    mov     x17, x19
    bl      getdigits

    adr     x17, mltp
    strb    w2 , [x17]
    adr     x17, mltp+1
    strb    w3 , [x17]

    ldr     x30, [sp]
    add     sp, sp, 16
    ret

// Insert second number into the buffer
second: 
    sub     sp, sp, 16
    str     x30, [sp]

    mov     x17, x18
    bl      getdigits

    adr     x17, mltp+5
    strb    w2 , [x17]
    adr     x17, mltp+6
    strb    w3 , [x17]

    ldr     x30, [sp]
    add     sp, sp, 16
    ret

// Insert result into the buffer
result:
    sub     sp, sp, 16
    str     x30, [sp]

    mul     x17, x18, x19
    bl      getdigits

    adr     x17, mltp+10
    strb    w1 , [x17]
    adr     x17, mltp+11
    strb    w2 , [x17]
    adr     x17, mltp+12
    strb    w3 , [x17]

    ldr     x30, [sp]
    add     sp, sp, 16
    ret

// Extract each digit from given number in r17
getdigits:
    sub     sp, sp, 16
    str     x30, [sp]

    // divide by 100 to get the first digit
    mov     x16, 0x64
    udiv    x1,  x17, x16
    msub    x2,  x1,  x16, x17

    // divide by 10 to get second and third digits
    mov     x16, 0x0A
    mov     x17, x2
    udiv    x2,  x17, x16
    msub    x3,  x2,  x16, x17

    // check first digit
    cmp     x1,  0x00
    b.ne    three
    mov     x1,  0x20

    // check second digit
    cmp     x2,  0x00
    b.ne    two
    mov     x2,  0x20
    b       one
three:
    add     x1, x1, 0x30
two:
    add     x2, x2, 0x30
one:
    add     x3, x3, 0x30

    ldr     x30, [sp]
    add     sp, sp, 16
    ret

// Print subroutine 
print:
    sub     sp, sp, 16
    str     x30, [sp]

    mov     x0, stdout
    mov     x8, sys_write
    svc     0

    ldr     x30, [sp]
    add     sp, sp, 16
    ret

.data
mltp:    
    .ascii   "## x ## = ###\n"
    mlen     =        . - mltp

line:    
    .ascii   "-------------\n"
    llen     =        . - line
    