	.file	"main.c"    
	.intel_syntax noprefix
	.text
    	.section .rodata
	.align 8
.LC0:
        .string "\nNumber of occurrences of different punctuation marks in a given ASCII string:"
	.section .rodata
.LC1:
        .string "%c\t%d\n"
    	.text
	.p2align 4
    	.globl  print_result
    	.type    print_result, @function
print_result:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     QWORD PTR [rbp-32], rsi
        lea     rdi, .LC0[rip]
        call    puts@PLT
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
	.size	print_result, .-print_result
	.p2align 4   
    	.globl  calculate
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
	.size	calculate, .-calculate
    	.section .rodata
.LC2:
        .string "String input:" 
    	.section .text
    	.globl  main
    	.type    main, @function
main:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 88
        mov     rax, rsp
        mov     rbx, rax
        mov     DWORD PTR [rbp-24], 100000
        mov     eax, DWORD PTR [rbp-24]
        movsx   rdx, eax
        sub     rdx, 1
        mov     QWORD PTR [rbp-32], rdx
        movsx   rdx, eax
        mov     r8, rdx
        mov     r9d, 0
        movsx   rdx, eax
        mov     rsi, rdx
        mov     edi, 0
        cdqe
        mov     edx, 16
        sub     rdx, 1
        add     rax, rdx
        mov     edi, 16
        mov     edx, 0
        div     rdi
        imul    rax, rax, 16
        sub     rsp, rax
        mov     rax, rsp
        add     rax, 0
        mov     QWORD PTR [rbp-40], rax
        mov     DWORD PTR [rbp-20], 0
        lea     rdi, .LC2[rip]
        call    puts@PLT
.L14:
        mov     rax, QWORD PTR stdin[rip]
        mov     rdi, rax
        call    fgetc@PLT
        mov     DWORD PTR [rbp-44], eax
        mov     eax, DWORD PTR [rbp-20]
        lea     edx, [rax+1]
        mov     DWORD PTR [rbp-20], edx
        mov     edx, DWORD PTR [rbp-44]
        mov     ecx, edx
        mov     rdx, QWORD PTR [rbp-40]
        cdqe
        mov     BYTE PTR [rdx+rax], cl
        mov     eax, DWORD PTR [rbp-20]
        cmp     eax, DWORD PTR [rbp-24]
        jge     .L16
        cmp     DWORD PTR [rbp-44], -1
        jne     .L14
        jmp     .L13
.L16:
        nop
.L13:
        mov     eax, DWORD PTR [rbp-20]
        sub     eax, 1
        mov     rdx, QWORD PTR [rbp-40]
        cdqe
        mov     BYTE PTR [rdx+rax], 0
        mov     eax, DWORD PTR [rbp-20]
        sub     eax, 1
        mov     DWORD PTR [rbp-48], eax
        movabs  rax, 2965689766566898734
        mov     QWORD PTR [rbp-56], rax
        mov     QWORD PTR [rbp-96], 0
        mov     QWORD PTR [rbp-88], 0
        mov     QWORD PTR [rbp-80], 0
        mov     QWORD PTR [rbp-72], 0
        mov     ecx, DWORD PTR [rbp-48]
        lea     rdx, [rbp-96]
        lea     rsi, [rbp-56]
        mov     rax, QWORD PTR [rbp-40]
        mov     rdi, rax
        call    calculate@PLT
        lea     rdx, [rbp-96]
        lea     rax, [rbp-56]
        mov     rsi, rdx
        mov     rdi, rax
        call    print_result@PLT
        mov     rsp, rbx
        mov     eax, 0
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
	.size	main, .-main