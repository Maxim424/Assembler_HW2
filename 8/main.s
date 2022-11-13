	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"You need to specify 2 files in the command line arguments: input and output"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	lea	ebx, -1[rdi]
	sub	rsp, 72
	mov	r13, rsp
	sub	rsp, 100000
	cmp	ebx, 2
	ja	.L11
	mov	r12, rsi
	mov	r14, rsp
	cmp	edi, 1
	je	.L12
	cmp	edi, 2
	je	.L13
	mov	edx, 100000
	mov	rsi, rsp
	mov	rdi, r12
	call	get_line_from_file@PLT
	mov	ecx, eax
.L5:
	lea	r8, -80[rbp]
	lea	r15, -88[rbp]
	pxor	xmm0, xmm0
	mov	rdi, r14
	movabs	rax, 2965689766566898734
	mov	rdx, r8
	mov	rsi, r15
	mov	QWORD PTR -104[rbp], r8
	mov	QWORD PTR -88[rbp], rax
	movups	XMMWORD PTR -80[rbp], xmm0
	movups	XMMWORD PTR -64[rbp], xmm0
	call	calculate@PLT
	cmp	ebx, 2
	mov	r8, QWORD PTR -104[rbp]
	je	.L7
	mov	rsi, r8
	mov	rdi, r15
	call	print_result_to_console@PLT
.L8:
	xor	eax, eax
	mov	rsp, r13
.L1:
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
.L13:
	mov	esi, 100000
	mov	rdi, rsp
	call	generate_str@PLT
	mov	ecx, eax
	jmp	.L5
.L7:
	mov	rdx, r12
	mov	rsi, r8
	mov	rdi, r15
	call	print_result_to_file@PLT
	jmp	.L8
.L11:
	lea	rsi, .LC0[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	mov	eax, 1
	mov	rsp, r13
	jmp	.L1
.L12:
	mov	esi, 100000
	mov	rdi, rsp
	call	get_line_from_console@PLT
	mov	ecx, eax
	jmp	.L5
	.size	main, .-main
	.ident	"GCC: (GNU) 10.3.0"
	.section	.note.GNU-stack,"",@progbits
