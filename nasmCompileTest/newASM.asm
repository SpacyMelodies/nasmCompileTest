bits 64
default rel

section .bss
    nums resd 1             ; Reserve 4 bytes (1 double word) for a 32-bit integer

section .data
    formatNum db "%d", 0    ; Format specifier for a 32-bit integer
    formatPrint db "%d", 0xA, 0 ; Format specifier for printing a 32-bit integer with a newline
    formatString db "%s", 0xa, 0
    msg1 db "ok will it work",0xa, 0

section .text
global main
extern ExitProcess
extern scanf
extern printf

main:
    ; Prologue
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32         ; Allocate 32 bytes on the stack

    lea rcx, [formatString]
    mov rdx, msg1
    call printf
    ; Call scanf to read an integer into nums
    lea rcx, [formatNum]    ; First argument: address of the format string
    lea rdx, [nums]         ; Second argument: address to store the integer
    call scanf

    ; Call printf to print the value in nums
    lea rcx, [formatPrint]  ; First argument: address of the format string
    mov rdx, nums         ; Second argument: value of the integer to print
    call printf

    mov rax, [nums]
    add rax, 12
    mov [nums], rax

    lea rcx, [formatPrint]
    mov rdx, [nums]
    call printf

    ; Epilogue
    add rsp, 32             ; Restore the stack pointer
    pop     rbp
    xor     rax, rax        ; Return 0
    call    ExitProcess
    ret

