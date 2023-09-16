; jump.asm
extern printf
section .data
    number1 dq  42
    number2 dq  41
    fmt1    db  "NUMBER1 >= NUMBER2",   10, 0
    fmt2    db  "NUMBER1 < NUMBER2",    10, 0

section .bss
section .text
    global main
main:
    push    rbp
    mov     rbp,    rsp
    mov     rax,    [number1]       ; 将number1放入寄存器
    mov     rbx,    [number2]       ; 将number2放入寄存器
    cmp     rax,    rbx             ; 比较rax和rbx的大小
    jge     greater                 ; 如果rax小于rbx，则跳转转到greater
    mov     rdi,    fmt2            ; 否则从这里继续执行
    mov     rax,    0               ; 不涉及xmm寄存器
    call    printf
    jmp     exit
greater:
    mov     rdi,    fmt1
    mov     rax,    0
    call    printf
exit:
    mov     rsp,    rbp
    pop     rbp
    ret
