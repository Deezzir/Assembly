section .text
global  _start

min       equ  0                         
max       equ 30        
stdout    equ  1   
sys_write equ  1   
sys_exit  equ 60          

_start:
    mov    r15, min     
    mov    r14, 0x0A     

loop:
    ; Get first and second digits
    mov    rdx, 0x0
    mov    rax, r15
    div    r14

    cmp    rax, 0x00
    jne    first
    mov    rax, 0x20
    jmp    second

first:
    add    rax, 0x30
second:
    mov    [msg+6], al
    add    rdx, 0x30
    mov    [msg+7], dl

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
msg     db      'Loop: ##',0x0A
len     equ      $ - msg
