section .text
global  _start

min       equ  0                         
max       equ 10        
stdout    equ  1   
sys_write equ  1   
sys_exit  equ 60          

_start:
    mov    r15, min          

loop:
    ; Convert index and put it in the string
    mov    r14, r15
    add    r14, 0x30
    mov    [msg+6], r14b

    ; Perform sys_write to print the msg
    mov    rdx, len                       
    mov    rsi, msg                       
    mov    rdi, stdout                   
    mov    rax, 1                         
    syscall

    ; Loop
    inc    r15               
    cmp    r15, max          
    jne    loop              

    ; Exit 
    mov    rdi, 0             
    mov    rax, sys_exit            
    syscall

section .data
msg     db      'Loop: #',0x0A
len     equ      $ - msg
