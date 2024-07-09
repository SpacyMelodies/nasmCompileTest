bits 64
default rel

section .data
	 var: dw 56

section .text
	global main

	extern WriteConsoleA
	extern GetStdHandle
	extern ExitProcess

main:
	push -11
	call GetStdHandle
	mov rcx, rax
	mov	rdx, [var]
	add rdx, 7
	mov r8, 5
	call WriteConsoleA
    xor rax, 0               ; Epilogue


    
    mov rcx, 0
    call ExitProcess
    ret
	