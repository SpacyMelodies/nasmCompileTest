bits 64
default rel

segment .bss
myNum3 resq 1

segment .data
    msg db "Hello world!", 0
    msg11 db "enter your nummber: ", 0
    format db "%d", 0
    myNum dq 110
    myNum2 dq 111
    crlf db "", 0xd, 0ax, 0

segment .text
global main
extern ExitProcess
extern scanf
extern printf

main:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32

    lea     rcx, [msg]
    call    printf
    lea rcx, [crlf]
    call printf
    lea rcx, [msg11]
    call printf
    lea rcx, format
    lea rdx, myNum3
    call scanf

    mov rax, [myNum]
    add rax, [myNum2]
    add rax, [myNum3]
    mov [myNum3], rax
    xor rax, rax

    lea rcx, format
    mov rdx, [myNum3]
    call printf
    xor rcx,rcx
    xor rdx, rdx

   call ExitProcess
    ret

