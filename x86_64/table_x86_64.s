section .text
global  _start

min       equ  1                         
max       equ 13        
stdout    equ  1   
sys_write equ  1   
sys_exit  equ 60       

_start:
    mov    r15, min 

mloop:
    mov    r14, min

    ; print break line 
    mov    rdx, llen
    mov    rsi, line
    call   print

iloop:
    call   first   ; get first number inserted
    call   second  ; get second number inserted
    call   result  ; get result number inserted

    ; print line
    mov    rdx, mlen
    mov    rsi, mltp
    call   print

    ; inner loop
    inc    r14
    cmp    r14, max
    jne    iloop

    ; outer loop
    inc    r15
    cmp    r15, max
    jne    mloop

    ; exit 
    mov    rdi, 0             
    mov    rax, sys_exit            
    syscall

; Insert first number into the buffer
first:
    mov    rax, r15
    call   getdigits
    mov    [mltp],   al
    mov    [mltp+1], dl
    ret

; Insert second number into the buffer
second:
    mov    rax, r14
    call   getdigits
    mov    [mltp+5], al
    mov    [mltp+6], dl
    ret

; Insert result into the buffer
result:
    mov    rax, r15
    mul    r14
    call   getdigits
    mov    [mltp+10], bl
    mov    [mltp+11], al
    mov    [mltp+12], dl
    ret

; Extract each digit from given number in r13
getdigits:
    ; divide by 100 to get the first digit
    mov    r13, 0x64
    mov    rdx, 0x0
    div    r13
    mov    rbx, rax

    ; divide by 10 to get second and third digits
    mov    r13, 0x0A
    mov    rax, rdx
    mov    rdx, 0x0
    div    r13

    ; check first digit
    cmp    rbx, 0x00
    jne    three
    mov    rbx, 0x20

    ; check second digit
    cmp    rax, 0x00
    jne    two
    mov    rax, 0x20
    jmp    one

three:
    add    rbx, 0x30
two: 
    add    rax, 0x30
one:  
    add    rdx, 0x30    
    ret

; Print subroutine 
print:
    mov    rdi, stdout
    mov    rax, 1
    syscall
    ret

section .data
mltp    db      '## x ## = ###',0x0A
mlen    equ      $ - mltp

line    db      '-------------',0x0A
llen    equ     $ - line