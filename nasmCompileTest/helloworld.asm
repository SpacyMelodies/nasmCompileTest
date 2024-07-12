bits 64
default rel

section .data
    msg db "Hello world!", 0xd, 0xa, 0
    msg_start db "Starting program...", 0xd, 0xa, 0
    msg_end db "End of program...", 0xd, 0xa, 0

section .text
global main
extern ExitProcess
extern printf

main:
    ; Prologue
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32

    ; Call printf
    lea     rcx, [msg]
    call    printf

    ; Call ExitProcess
    xor     rax, rax
    call    ExitProcess

    ; Epilogue
    mov     rsp, rbp
    pop     rbp
    ret