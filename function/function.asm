; function.asm
extern printf
section .data
    radius  dq  10.0
    pi      dq  3.14
    fmt     db  "The area of the circle with a radius of %.2f is %.2f",   10, 0
section .bss
section .text
    global  main
main:
    push    rbp
    mov     rbp,    rsp
    call    area
    mov     rdi,    fmt
    movsd   xmm0,   [radius]
    mov     rax,    2
    call    printf
    leave
    ret
; ============================================================
area:
    push    rbp
    mov     rbp,    rsp
    movsd   xmm1,   [radius]
    mulsd   xmm1,   [radius]
    mulsd   xmm1,   [pi]
    leave
    ret
