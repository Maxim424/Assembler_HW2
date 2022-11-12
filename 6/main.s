    .intel_syntax noprefix
    
    .section .rodata
.LC0:
        .string "Number of occurrences of different punctuation marks in a given ASCII string:"
.LC1:
        .string "%c\t%d\n"
        
    .section .text
    .global  print_result
    .type    print_result, @function
print_result:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        lea     rdi, .LC0[rip]
        call    puts
        mov     DWORD PTR [rbp-4], 0
        jmp     .L2
.L3:
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        lea     rdx, [0+rax*4]
        mov     rax, QWORD PTR [rbp-32]
        add     rax, rdx
        mov     edx, DWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-4]
        movsx   rcx, eax
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rcx
        movzx   eax, BYTE PTR [rax]
        movsx   eax, al
        mov     esi, eax
        lea     rdi, .LC1[rip]
        mov     eax, 0
        call    printf
        add     DWORD PTR [rbp-4], 1
.L2:
        cmp     DWORD PTR [rbp-4], 7
        jle     .L3
        nop
        nop
        leave
        ret
        
    .global  calculate
    .type    calculate, @function
calculate:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        mov     QWORD PTR [rbp-40], rdx
        mov     DWORD PTR [rbp-44], ecx
        mov     DWORD PTR [rbp-4], 0
        jmp     .L5
.L10:
        mov     DWORD PTR [rbp-8], 0
        jmp     .L6
.L9:
        mov     eax, DWORD PTR [rbp-4]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rdx
        movzx   edx, BYTE PTR [rax]
        mov     eax, DWORD PTR [rbp-8]
        movsx   rcx, eax
        mov     rax, QWORD PTR [rbp-32]
        add     rax, rcx
        movzx   eax, BYTE PTR [rax]
        cmp     dl, al
        jne     .L7
        mov     eax, DWORD PTR [rbp-8]
        cdqe
        lea     rdx, [0+rax*4]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     edx, DWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-8]
        cdqe
        lea     rcx, [0+rax*4]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rcx
        add     edx, 1
        mov     DWORD PTR [rax], edx
        jmp     .L8
.L7:
        add     DWORD PTR [rbp-8], 1
.L6:
        cmp     DWORD PTR [rbp-8], 7
        jle     .L9
.L8:
        add     DWORD PTR [rbp-4], 1
.L5:
        mov     eax, DWORD PTR [rbp-4]
        cmp     eax, DWORD PTR [rbp-44]
        jl      .L10
        nop
        nop
        pop     rbp
        ret
        
    .section .rodata
.LC2:
        .string "String input:"
        
    .section .text
    .global  main
    .type    main, @function
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 1072
        mov     DWORD PTR [rbp-4], 0
        lea     rdi, .LC2[rip]
        call    puts
.L12:
        mov     rax, QWORD PTR stdin[rip]
        mov     rdi, rax
        call    fgetc
        mov     DWORD PTR [rbp-8], eax
        mov     eax, DWORD PTR [rbp-4]
        lea     edx, [rax+1]
        mov     DWORD PTR [rbp-4], edx
        mov     edx, DWORD PTR [rbp-8]
        cdqe
        mov     BYTE PTR [rbp-1024+rax], dl
        cmp     DWORD PTR [rbp-8], -1
        jne     .L12
        mov     eax, DWORD PTR [rbp-4]
        sub     eax, 1
        cdqe
        mov     BYTE PTR [rbp-1024+rax], 0
        mov     eax, DWORD PTR [rbp-4]
        sub     eax, 1
        mov     DWORD PTR [rbp-12], eax
        movabs  rax, 2965689766566898734
        mov     QWORD PTR [rbp-1032], rax
        mov     QWORD PTR [rbp-1072], 0
        mov     QWORD PTR [rbp-1064], 0
        mov     QWORD PTR [rbp-1056], 0
        mov     QWORD PTR [rbp-1048], 0
        mov     ecx, DWORD PTR [rbp-12]
        lea     rdx, [rbp-1072]
        lea     rsi, [rbp-1032]
        lea     rax, [rbp-1024]
        mov     rdi, rax
        call    calculate
        lea     rdx, [rbp-1072]
        lea     rax, [rbp-1032]
        mov     rsi, rdx
        mov     rdi, rax
        call    print_result
        mov     eax, 0
        leave
        ret