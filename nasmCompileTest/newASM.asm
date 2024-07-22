bits 64
default rel

section .bss
buffer resb 256  ; Buffer for input

section .data
formatString db "%s", 0  ; Format string for printf

section .text
global main
extern ExitProcess
extern printf
extern GetStdHandle
extern ReadConsole

main:
    ; Prologue
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32

    ; Get console input handle
    mov     rdi, -10         ; STD_INPUT_HANDLE
    call    GetStdHandle
    mov     rbx, rax         ; Store handle in RBX

    ; Read input from console
    lea     rcx, [buffer]    ; Buffer address
    mov     rdx, 256         ; Buffer size
    xor     r8, r8           ; Pointer to number of characters read (NULL)
    mov     rsi, rbx         ; Console handle
    call    ReadConsole

    ; Print the input string
    xor     rax, rax
    lea     rcx, [formatString]  ; Format string
    lea     rdx, [buffer]        ; Buffer address
    call    printf

    ; Exit process
    xor     rax, rax
    xor     rcx, rcx
    xor     rdx, rdx
    call    ExitProcess

    ; Epilogue
    mov     rsp, rbp
    pop     rbp
    ret