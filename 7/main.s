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
	mov	eax, edi
	and	eax, -3
	mov	rbp, rsp
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 48
	mov	rbx, rsp
	sub	rsp, 100000
	cmp	eax, 1
	jne	.L8
	cmp	edi, 1
	je	.L9
	mov	r12, rsi
	mov	edx, 100000
	lea	r14, -64[rbp]
	mov	rsi, rsp
	mov	rdi, r12
	lea	r13, -72[rbp]
	call	get_line_from_file@PLT
	lea	rdi, -64[rbp]
	mov	rdx, r14
	mov	rsi, r13
	mov	r8d, eax
	mov	ecx, 8
	movabs	rax, 2965689766566898734
	mov	QWORD PTR -72[rbp], rax
	xor	eax, eax
	rep stosd
	mov	rdi, rsp
	mov	ecx, r8d
	call	calculate@PLT
	mov	rdx, r12
	mov	rsi, r14
	mov	rdi, r13
	call	print_result_to_file@PLT
.L5:
	xor	eax, eax
	mov	rsp, rbx
.L1:
	lea	rsp, -32[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	rbp
	ret
.L9:
	mov	rdi, rsp
	lea	r13, -64[rbp]
	lea	r12, -72[rbp]
	mov	esi, 100000
	call	get_line_from_console@PLT
	lea	rdi, -64[rbp]
	mov	rsi, r12
	mov	rdx, r13
	mov	r8d, eax
	mov	ecx, 8
	movabs	rax, 2965689766566898734
	mov	QWORD PTR -72[rbp], rax
	xor	eax, eax
	rep stosd
	mov	rdi, rsp
	mov	ecx, r8d
	call	calculate@PLT
	mov	rsi, r13
	mov	rdi, r12
	call	print_result_to_console@PLT
	jmp	.L5
.L8:
	lea	rsi, .LC0[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	mov	eax, 1
	mov	rsp, rbx
	jmp	.L1
	.size	main, .-main
	.ident	"GCC: (GNU) 10.3.0"
	.section	.note.GNU-stack,"",@progbits
