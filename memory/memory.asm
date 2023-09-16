; memory.asm
section .data
    bNum    db  123
    wNum    dw  12345
    warray  times   5   dw  0           ; 包含5个元素的数组
                                        ; 元素都是0
    dNum    dd  12345
    qNum1   dq  12345
    text1   db  "abc",  0
    qNum2   dq  3.141592654
    text2   db  "cde",  0
section .bss
    bvar    resb    1
    dvar    resd    1
    wvar    resw    10
    qvar    resq    3
section .text
    global main
main:
    push    rbp
    mov     rbp,    rsp
    lea     rax,    [bNum]
    mov     rax,    bNum                ; 在rax中加载bNum的地址
    mov     rax,    [bNum]              ; 在rax中加载bNum的值
    mov     [bvar], rax                 ; 将rax中的数据加载到bvar的地址
    lea     rax,    [bvar]              ; 在rax中加载bvar的地址
    lea     rax,    [wNum]              ; 在rax中加载wNum的地址
    mov     rax,    [wNum]              ; 在rax中加载wNum的内容
    lea     rax,    [text1]
    mov     rax,    text1               ; 在rax中加载text1的地址
    mov     rax,    text1 + 1
    lea     rax,    [text1 + 1]         ; 在rax中加载第二个字符
    mov     rax,    [text1]             ; 在rax中从text1开始加载
    mov     rax,    [text1 + 1]         ; 在rax中从text1 + 1开始加载
    mov     rsp,    rbp
    pop     rbp
    ret
