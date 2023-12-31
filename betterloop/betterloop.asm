; betterloop.asm
extern  printf
section .data
    number  dq  1000000000
    fmt     db  "The sum from 0 to %ld is %ld", 10, 0
section .bss
section .text
    global main
main:
    push    rbp
    mov     rbp,    rsp
    mov     rcx,    [number]        ; 使用number初始化rcx
    mov     rax,    0
bloop:
    add     rax,    rcx
    loop    bloop                   ; 每次循环rcx都递减1，直到等于0
    mov     rdi,    fmt
    mov     rsi,    [number]
    mov     rdx,    rax
    mov    rax,    0
    call    printf
    
    mov     rsp,    rbp
    pop     rbp
    ret
