bits 64
default rel

section .data
    var dw 56          ; Define var as a 16-bit integer with initial value 56
    format db "%d", 0  ; Define format as a null-terminated string "%d"

section .text
    global main

    extern WriteConsoleA
    extern GetStdHandle
    extern ExitProcess

main:
    ; Call GetStdHandle to get the standard output handle
    push -11            ; STD_OUTPUT_HANDLE = -11
    call GetStdHandle
    mov rcx, rax        ; Move the handle into rcx as the first parameter for WriteConsoleA

    ; Calculate the updated value of var (56 + 7 = 63)
    movzx rax, word [var]  ; Load var into rax (zero-extended to 64-bit)
    add rax, 7             ; Add 7 to the value of var
    mov word [var], ax     ; Store the updated value back into var

    ; Convert var to a string using format specifier
    lea rdx, [format]   ; Load address of format specifier into rdx

    ; Prepare parameters for WriteConsoleA
    lea r8, [var]       ; Load address of var into r8
    mov r9d, 2          ; Length of the string to write (including null terminator)

    ; Call WriteConsoleA
    call WriteConsoleA

    ; Exit the process
    xor edi, edi        ; Set exit code to 0
    call ExitProcess

    ; Exit point
    ret