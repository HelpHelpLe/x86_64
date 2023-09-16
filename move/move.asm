; move.asm
section .data
    bNum    db  123
    wNum    dw  12345
    dNum    dd  1234567890
    qNum1   dq  1234567890123456789
    qNum2   dq  123456
    qNum3   dq  3.14
section .bss
section .text
    global  main
main:
    push    rbp
    mov     rbp,    rsp
    
    mov     rax,    -1              ; 把-1放入rax中，即rax中的所有位都是1
    mov     al,     byte [bNum]     ; 不清除rax的高位（upper bits）
    xor     rax,    rax             ; 清除rax
    mov     al,     byte [bNum]     ; 现在rax中是正确的值

    mov     rax,    -1              ; 把-1放入rax中，即rax中的所有位都是1
    mov     ax,     word [wNum]     ; 不清除rax的高位（upper bits）
    xor     rax,    rax             ; 清除
    mov     ax,     word [wNum]     ; 现在rax中是正确的值

    mov     rax,    -1              ; 把-1放入rax中，即rax中的所有位都是1
    mov     eax,    dword [dNum]    ; 不清除rax的高位（upper bits）
    
    mov     rax,    -1              ; 把-1放入rax中，即rax中的所有位都是1
    mov     rax,    qword [qNum1]   ; 不清除rax的高位（upper bits）
    mov     qword [qNum2],  rax     ; 有一个操作数永远是一个寄存器
    mov     rax,    123456          ; 源操作数是一个即时数

    movq    xmm0,   [qNum3]         ; 浮点数指令
    
    mov     rsp,    rbp
    pop     rbp
    
    ret
