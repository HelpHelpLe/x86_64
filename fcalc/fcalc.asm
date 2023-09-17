; fcalc.asm
extern printf
section .data
    number1     dq  9.0
    number2     dq  73.0
    fmt         db  "The numbers are %f and %f",    10, 0
    fmtfloat    db  "%s %f",    10, 0
    f_sum       db  "The float sum of %f and %f is %f", 10, 0
    f_dif       db  "The float difference of %f and %f is %f",  10, 0
    f_mul       db  "The float product of %f and %f is %f", 10, 0
    f_div       db  "The float division of %f by %f is %f", 10, 0
    f_sqrt      db  "The float squareroot of %f is %f", 10, 0
section .bss
section .text
    global main
main:
    push    rbp
    mov     rbp,    rsp

    movsd   xmm0,   [number1]
    movsd   xmm1,   [number2]
    mov     rdi,    fmt
    mov     rax,    2                   ; 两个浮点数
    call    printf
    ; 和（sum）
    movsd   xmm2,   [number1]
    addsd   xmm2,   [number2]
    ; 打印结果
    movsd   xmm0,   [number1]
    movsd   xmm1,   [number2]
    mov     rdi,    f_sum
    mov     rax,    3                   ; 三个浮点数
    call    printf
    ; 差（difference）
    movsd   xmm2,   [number1]
    subsd   xmm2,   [number2]
    ; 打印结果
    movsd   xmm0,   [number1]
    movsd   xmm1,   [number2]
    mov     rdi,    f_dif
    mov     rax,    3
    call    printf
    ; 积（multiplication）
    movsd   xmm2,   [number1]
    mulsd   xmm2,   [number2]
    ; 打印结果
    movsd   xmm0,   [number1]
    movsd   xmm1,   [number2]
    mov     rdi,    f_mul
    mov     rax,    3
    call    printf
    ; 除法（division）
    movsd   xmm2,   [number1]
    divsd   xmm2,   [number2]
    ; 打印结果
    movsd   xmm0,   [number1]
    movsd   xmm1,   [number2]
    mov     rdi,    f_div
    mov     rax,    3
    call    printf
    ; 平方根（squareroot）
    sqrtsd  xmm1,   [number1]
    ; 打印结果
    movsd   xmm0,   [number1]
    mov     rdi,    f_sqrt
    mov     rax,    2
    call    printf
    ; exit
    mov     rsp,    rbp
    pop     rbp
    ret

