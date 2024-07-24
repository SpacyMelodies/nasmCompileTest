bits 64
default rel
section .bss
nums resq 1
myStr resb 512
chars resb 4
section .Data
formatNum db "%ld", 0
formatString db "%s",0
msg0 db "Hello, World from my own compiler!", 0xd, 0xa, 0
hello db "boss", 0xd, 0xa, 0
drag db "nono", 0xd, 0xa, 0
crlf db "",0xd,0xa, 0
myNumber dq 8
section .text
global main
extern ExitProcess
extern scanf
extern printf
extern GetStdHandle
extern ReadConsoleA

; This works but sometimes needs an extra \n ?
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

sub rsp, 40
mov rcx, -10 ;-10 = stdinputhandle
call GetStdHandle
mov rcx, rax
xor rdx, rdx
mov rdx, myStr
mov r8, 511
mov r9, chars
mov rax, 0
mov qword [rsp+0x20], 0
call ReadConsoleA
add rsp, 40


mov rdx, [nums]
add rdx, 82
mov [nums], rdx

lea rcx, [formatNum]
mov rdx, [nums]
xor rax, rax
call printf

lea rcx, [formatString]
lea rdx, [myStr]
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