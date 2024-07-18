bits 64
default rel
section .bss
nums resq 1
section .Data
format db "%d",0xd, 0xa, 0
formatString db "%s",0
 msg0 db "Hello, World from my own compiler!", 0xd, 0xa, 0
hello db "boss", 0xd, 0xa, 0
drag db "nono", 0xd, 0xa, 0
section .text
global main
extern ExitProcess
extern scanf
extern printf

main:
    ; shadow space for windowss
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32

lea rcx, [format]
mov rdx, 8
call printf



lea rcx, [msg0]
call printf




lea rcx, [formatString]
lea rdx, [nums]
call scanf


lea rcx, [hello]
call printf



lea rcx, [nums]
call printf

mov r10, 55
add r10, [nums]
mov [nums], r10

lea rcx, [nums]
call printf


FINAL:
   xor rax, rax
    xor rcx, rcx
    xor rdx, rdx
    ; Exit process
    call    ExitProcess
 
    ; Epilogue
    mov     rsp, rbp
    pop     rbp
    ret