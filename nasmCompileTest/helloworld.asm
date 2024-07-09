bits 64
default rel

section .data
    msg: db "hello I'm Mikey", 0 ;10 = new line 0 = 0 terminated

section .text
    global main
	    
    extern WriteConsoleA
    extern GetStdHandle
    extern ExitProcess
    
main:

    push 0
    mov rcx, -11                ; STD_OUTPUT_HANDLE
    call GetStdHandle
    mov r9, 0                   ; charsWritten
    mov r8, 17                  ; toWrite
    mov rdx, msg                ; message
    mov rcx, rax                ; handle
    call WriteConsoleA

    xor rax, 0               ; Epilogue


    
    mov rcx, 0
    call ExitProcess
    ret