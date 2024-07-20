bits 64
default rel
section .bss
nums resq 1
myStr resb 256
section .Data
formatNum db "%d",0
formatString db "%s",0
 msg0 db "Hello, World from my own compiler!", 0xd, 0xa, 0
hello db "boss", 0xd, 0xa, 0
drag db "nono", 0xd, 0xa, 0
boner dq 8
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
xor rax, rax
lea rcx, [formatNum]
mov rdx, 8
call printf


xor rax, rax
lea rcx, [formatString]
mov rdx, msg0
call printf

xor rax, rax
lea rcx, [formatNum]
lea rdx, [nums]
call scanf

xor rax, rax
lea rcx, [formatNum]
mov rdx, [nums]
call printf

   xor rax, rax
    xor rcx, rcx
    xor rdx, rdx
lea rcx, [formatString]
lea rdx, [myStr]
call scanf

xor rax, rax
lea rcx, [formatString]
mov rdx, myStr
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
