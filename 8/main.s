	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"You need to specify 2 files in the command line arguments: input and output"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Program execution time:\t%f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	push	rbp
	lea	eax, -1[rdi]
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 88
	mov	QWORD PTR -120[rbp], rsi
	mov	QWORD PTR -104[rbp], rsp
	sub	rsp, 500000
	mov	DWORD PTR -108[rbp], eax
	cmp	eax, 2
	ja	.L15
	mov	r12, rsp
	cmp	edi, 1
	je	.L16
	cmp	edi, 2
	je	.L17
	mov	rdi, QWORD PTR -120[rbp]
	mov	edx, 500000
	mov	rsi, rsp
	call	get_line_from_file@PLT
	mov	ebx, eax
.L5:
	pxor	xmm0, xmm0
	lea	r14, -80[rbp]
	lea	r13, -88[rbp]
	xor	r15d, r15d
	movabs	rax, 2965689766566898734
	movups	XMMWORD PTR -80[rbp], xmm0
	mov	QWORD PTR -88[rbp], rax
	movups	XMMWORD PTR -64[rbp], xmm0
	call	clock@PLT
	mov	QWORD PTR -128[rbp], rax
	.p2align 4,,10
	.p2align 3
.L9:
	add	r15d, 1
	cmp	r15d, 1
	jne	.L18
.L7:
	mov	ecx, ebx
	mov	rdx, r14
	mov	rsi, r13
	mov	rdi, r12
	call	calculate@PLT
	add	r15d, 1
	cmp	r15d, 1
	je	.L7
.L18:
	pxor	xmm0, xmm0
	mov	ecx, ebx
	mov	rdx, r14
	mov	rsi, r13
	movups	XMMWORD PTR [r14], xmm0
	mov	rdi, r12
	movups	XMMWORD PTR 16[r14], xmm0
	call	calculate@PLT
	cmp	r15d, 1000
	jne	.L9
	call	clock@PLT
	pxor	xmm0, xmm0
	sub	rax, QWORD PTR -128[rbp]
	lea	rsi, .LC2[rip]
	cvtsi2sd	xmm0, rax
	mov	edi, 1
	mov	eax, 1
	divsd	xmm0, QWORD PTR .LC1[rip]
	call	__printf_chk@PLT
	cmp	DWORD PTR -108[rbp], 2
	je	.L10
	mov	rsi, r14
	mov	rdi, r13
	call	print_result_to_console@PLT
.L11:
	mov	rsp, QWORD PTR -104[rbp]
	xor	eax, eax
.L1:
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
.L17:
	mov	esi, 500000
	mov	rdi, rsp
	call	generate_str@PLT
	mov	ebx, eax
	jmp	.L5
.L10:
	mov	rdx, QWORD PTR -120[rbp]
	mov	rsi, r14
	mov	rdi, r13
	call	print_result_to_file@PLT
	jmp	.L11
.L15:
	lea	rsi, .LC0[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	mov	eax, 1
	mov	rsp, QWORD PTR -104[rbp]
	jmp	.L1
.L16:
	mov	esi, 500000
	mov	rdi, rsp
	call	get_line_from_console@PLT
	mov	ebx, eax
	jmp	.L5
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1093567616
	.ident	"GCC: (GNU) 10.3.0"
	.section	.note.GNU-stack,"",@progbits
