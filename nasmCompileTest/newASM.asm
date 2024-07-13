bits 64
default rel

section .bss

section .data
    msg db "How many Fibonacci numbers: ", 0

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

    ; Print "How many Fibonacci numbers: "
    lea     rcx, [msg]
    call    printf

FINAL:
   xor rax, rax
   xor rcx, rcx
   xor rdx, rdx
    ; Exit process
    call    ExitProcess
 
    ; Epilogue
    mov     rsp, rbp ; free the shadow space
    pop     rbp
    ret

