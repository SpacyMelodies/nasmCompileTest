bits 64
default rel
section .bss
nums resq 1
myStr resb 256
chars resb 4
section .Data
formatNum db "%d", 0
formatString db "%s",0
 msg0 db "Hello, World from my own compiler!", 0xd, 0xa, 0
hello db "boss", 0xd, 0xa, 0
drag db "nono", 0xd, 0xa, 0
number dq 8
section .text
global main
extern ExitProcess
extern scanf
extern printf
extern GetStdHandle
extern ReadConsoleA

main:
    ; shadow space for windowss
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32

lea rcx, [formatNum]
mov rdx, 8
xor rax, rax
call printf



lea rcx, [formatString]
mov rdx, msg0
xor rax, rax
call printf

lea rcx, [formatNum]
lea rdx, [nums]
xor rax, rax
call scanf
xor rcx,rcx
xor rdx, rdx


sub rsp, 40
mov rcx, -10 ;-10 = stdinputhandle
call GetStdHandle
mov rcx, rax
 xor rdx, rdx
mov rdx, myStr
mov r8, 255
mov r9, chars
mov rax, qword 0
mov qword [rsp+0x20], rax
call ReadConsoleA
movzx r12, byte[myStr]
add rsp, 40

xor rcx,rcx
xor rdx, rdx

lea rcx, [formatString]
mov rdx, myStr
xor rax, rax
call printf

lea rcx, [formatNum]
mov rdx, [nums]
xor rax, rax
call printf

lea rcx, [formatNum]
mov rdx, [number]
xor rax, rax
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