.text
.globl _start

min       = 0                          
max       = 10
stdout    = 1  
sys_write = 64   
sys_exit  = 93                    

_start:
    mov     x19, min

loop:
    // Get digit
    add     x18, x19, 0x30
    adr     x17, msg+6
    strb    w18, [x17]

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
msg:  .ascii "Loop: #\n"
len = . - msg 
