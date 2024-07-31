bits 64
default rel

section .bss
nums resq 1
myStr resb 512
chars resb 4

section .data
formatNum db "%ld", 0  ; Added newline character
formatString db "%s", 0
msg0 db "Hello, World from my own compiler!", 0
myNumber dq 8

section .text
global main
extern ExitProcess
extern printf

main:
    ; Prologue
    push rbp
    mov rbp, rsp
    sub rsp, 32  ; Shadow space for Windows
    ; Assuming MyNumber is initialized somewhere
           ; Load MyNumber into rax
    mov rcx, 8
    
loopy:
    push rcx; Save the value of rax before printf modifies it
    lea rcx, [formatNum]
    mov rdx, [msg0]          ; Load the number into rdx
    call printf            ; Call printf
    pop rcx                ; Restore the original value of rax

    add 

    dec rcx                ; Decrement the number

    loop loopy         ; Jump to loop if myNumber > 0

    ; Cleanup and exit
    xor rax, rax
    xor rcx, rcx
    xor rdx, rdx
    call ExitProcess

    ; Epilogue
    mov rsp, rbp
    pop rbp
    ret