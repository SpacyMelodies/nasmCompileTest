bits 64
default rel

section .bss
    myNum  resq 1  
    myNum2 resq 1  
    myNum3 resq 1  
    count  resq 1  

section .data
    msg db "How many Fibonacci numbers: ", 0
    format db "%d", 0
    crlf db "", 10, 0  ; new line

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

    ; Read user input for count of Fibonacci numbers
    lea     rcx, [format]
    lea     rdx, [count]
    call    scanf

    ; Initialize Fibonacci sequence variables
    mov     qword [myNum], 0   
    mov     qword [myNum2], 1  

    ; Check if count is zero (edge case)
    cmp     qword [count], 0
    jz      FINAL
    lea rcx, [crlf]
    call printf
L1:
    ; Print current Fibonacci number
    lea     rcx, [format]
    mov     rdx, qword [myNum]
    call    printf
    lea rcx, [crlf]
    call printf
    ; Calculate next Fibonacci number
    mov     rax, qword [myNum]
    add     rax, qword [myNum2]
    mov     qword [myNum3], rax  ; myNum3 = myNum + myNum2

    ; Update variables for next iteration
    mov     rax, qword [myNum2]
    mov     qword [myNum], rax   ; myNum = myNum2

    mov     rax, qword [myNum3]
    mov     qword [myNum2], rax  ; myNum2 = myNum3

    ; Decrement count
    dec     qword [count]

    ; Check if count is zero to terminate the loop
    cmp     qword [count], 0
    jz      FINAL

    ; Jump back to L1 for next Fibonacci number
    jmp     L1

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

