section .data
    msg db  "hello, world!", 10, 0
    msgLen  equ $-msg-1
section .bss
section .text
    global  main
main:
    mov     rax,    1
    mov     rdi,    1
    mov     rsi,    msg
    mov     rdx,    msgLen
    syscall
    mov     rax,    60
    mov     rdi,    0
    syscall

