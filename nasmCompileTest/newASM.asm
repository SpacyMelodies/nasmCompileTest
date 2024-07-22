bits 64
default rel

section .bss
buffer resb 256        ; Buffer for input
bytesRead resd 1       ; Number of bytes read
bytesWritten resd 1    ; Number of bytes written
chars resb 4

section .data
stdInputHandle dq -12  ; STD_INPUT_HANDLE
stdOutputHandle dq -11 ; STD_OUTPUT_HANDLE

format db "%s", 0


section .text
global main
extern ExitProcess
extern ReadConsoleA
extern GetStdHandle
extern printf


main:
    ; Prologue
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32

    ; Get handle to the console input
             ; Save handle to rbx

     sub rsp, 40
        ;get the input handle
        mov rcx, -10           ;specifies that the input handle is required
        call GetStdHandle

        ;get value from keyboard
        mov rcx, rax                        ;place the handle for operation
        xor rdx, rdx
        mov rdx, buffer               ;set name to receive input from keyboard
        mov r8, 255                           ;max number of characters to read
        mov r9, chars                       ;stores the number of characters actually read

        mov rax, qword 0                    ;fifth argument
        mov qword [rsp+0x20], rax

        call ReadConsoleA
        movzx r12, byte[buffer]
        add rsp, 40

    lea rcx, [format]
    lea rdx, [buffer]
    xor rax, rax
    call printf

    ; Exit process
    xor     rdi, rdi               ; Exit code 0
    call    ExitProcess

    ; Epilogue
    mov     rsp, rbp
    pop     rbp
    ret