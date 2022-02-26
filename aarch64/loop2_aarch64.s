.text
.globl _start

min       = 0
max       = 30
stdout    = 1
sys_write = 64
sys_exit  = 93

_start:
    mov     x19, min
    mov     x16, 0x0A

loop:
    //  Get first and second digits
    udiv    x17, x19, x16
    msub    x18, x17, x16, x19

    cmp     x17, 0x00
    b.ne    first
    mov     x17, 0x20
    b       second

first:
    add     x17, x17, 0x30
second:
    adr     x15, msg+6
    strb    w17, [x15]

    add     x18, x18, 0x30
    adr     x15, msg+7
    strb    w18, [x15]

    // Perform sys_write to print the msg
    mov     x0, stdout
    adr     x1, msg
    mov     x2, len
    mov     x8, sys_write
    svc     0

    // Loop
    add     x19, x19, 1
    cmp     x19, max
    b.ne    loop

    // Exit 
    mov     x0, 0
    mov     x8, sys_exit
    svc     0

.data
msg:  
    .ascii "Loop: ##\n"
    len = . - msg
    