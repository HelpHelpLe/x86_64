; stack.asm
extern printf
section .data
    strng       db  "ABCDE",    0
    strngLen    equ $ - strng - 1
    fmt1        db  "The original string: %s",  10, 0
    fmt2        db  "The reversed string: %s",  10, 0
section .bss
section .text
    global  main
main:
    push    rbp
    mov     rbp,    rsp
    ; 打印原始字符串
    mov     rdi,    fmt1
    mov     rsi,    strng
    mov     rax,    0
    call    printf
    ; 将字符串逐个字符地压入堆栈
    xor     rax,    rax
    mov     rbx,    strng
    mov     rcx,    strngLen                    ; rcx为循环计数器
    mov     r12,    0                           ; 使用r12作为指针
    pushLoop:
        mov     al,     byte [rbx + r12]        ; 把字符移到rax
        push    rax
        inc     r12
        loop    pushLoop
    ; 将字符串从堆栈中逐个字符地弹出
    ; 这将反转原始字符串
    mov     rbx,    strng
    mov     rcx,    strngLen
    mov     r12,    0
    popLoop:
        pop     rax
        mov     byte [rbx + r12],   al
        inc     r12
        loop    popLoop
        mov     byte [rbx + r12],   0           ; 使用0终止字符串
    ; 打印反转后的字符串
    mov     rdi,    fmt2
    mov     rsi,    strng
    mov     rax,    0
    call    printf

    mov     rsp,    rbp
    pop     rbp
    ret
