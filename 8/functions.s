	.file	"functions.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"\nNumber of occurrences of different punctuation marks in a given ASCII string:"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%c\t%d\n"
	.text
	.p2align 4
	.globl	print_result_to_console
	.type	print_result_to_console, @function
print_result_to_console:
	push	r13
	lea	r13, .LC1[rip]
	push	r12
	mov	r12, rdi
	lea	rdi, .LC0[rip]
	push	rbp
	mov	rbp, rsi
	push	rbx
	xor	ebx, ebx
	sub	rsp, 8
	call	puts@PLT
	.p2align 4,,10
	.p2align 3
.L2:
	mov	ecx, DWORD PTR 0[rbp+rbx*4]
	movsx	edx, BYTE PTR [r12+rbx]
	mov	rsi, r13
	xor	eax, eax
	mov	edi, 1
	add	rbx, 1
	call	__printf_chk@PLT
	cmp	rbx, 8
	jne	.L2
	add	rsp, 8
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	ret
	.size	print_result_to_console, .-print_result_to_console
	.section	.rodata.str1.1
.LC2:
	.string	"w+"
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"The result is written to the file!"
	.align 8
.LC4:
	.string	"Number of occurrences of different punctuation marks in a given ASCII string:\n"
	.text
	.p2align 4
	.globl	print_result_to_file
	.type	print_result_to_file, @function
print_result_to_file:
	push	r14
	lea	r14, .LC1[rip]
	push	r13
	mov	r13, rdi
	push	r12
	mov	r12, rsi
	lea	rsi, .LC2[rip]
	push	rbp
	push	rbx
	mov	rdi, QWORD PTR 16[rdx]
	xor	ebx, ebx
	call	fopen@PLT
	lea	rsi, .LC3[rip]
	mov	edi, 1
	mov	rbp, rax
	xor	eax, eax
	call	__printf_chk@PLT
	mov	rcx, rbp
	mov	edx, 78
	mov	esi, 1
	lea	rdi, .LC4[rip]
	call	fwrite@PLT
	.p2align 4,,10
	.p2align 3
.L7:
	movsx	ecx, BYTE PTR 0[r13+rbx]
	mov	r8d, DWORD PTR [r12+rbx*4]
	mov	rdx, r14
	mov	rdi, rbp
	mov	esi, 1
	xor	eax, eax
	add	rbx, 1
	call	__fprintf_chk@PLT
	cmp	rbx, 8
	jne	.L7
	pop	rbx
	mov	rdi, rbp
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	jmp	fclose@PLT
	.size	print_result_to_file, .-print_result_to_file
	.p2align 4
	.globl	calculate
	.type	calculate, @function
calculate:
	mov	r8, rdx
	test	ecx, ecx
	jle	.L10
	lea	eax, -1[rcx]
	lea	rcx, 1[rdi+rax]
	.p2align 4,,10
	.p2align 3
.L15:
	movzx	edx, BYTE PTR [rdi]
	xor	eax, eax
	.p2align 4,,10
	.p2align 3
.L14:
	cmp	dl, BYTE PTR [rsi+rax]
	je	.L18
	add	rax, 1
	cmp	rax, 8
	jne	.L14
	add	rdi, 1
	cmp	rdi, rcx
	jne	.L15
.L10:
	ret
	.p2align 4,,10
	.p2align 3
.L18:
	add	rdi, 1
	add	DWORD PTR [r8+rax*4], 1
	cmp	rdi, rcx
	jne	.L15
	jmp	.L10
	.size	calculate, .-calculate
	.section	.rodata.str1.1
.LC5:
	.string	"String input:"
	.text
	.p2align 4
	.globl	get_line_from_console
	.type	get_line_from_console, @function
get_line_from_console:
	push	r13
	push	r12
	mov	r12d, esi
	push	rbp
	xor	ebp, ebp
	push	rbx
	mov	rbx, rdi
	lea	rdi, .LC5[rip]
	sub	rsp, 8
	call	puts@PLT
	mov	r13, QWORD PTR stdin@GOTPCREL[rip]
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L28:
	cmp	ebp, r12d
	jge	.L22
.L20:
	mov	rdi, QWORD PTR 0[r13]
	call	fgetc@PLT
	mov	r8d, ebp
	mov	rdx, rbx
	add	ebp, 1
	mov	BYTE PTR [rbx], al
	add	rbx, 1
	cmp	eax, -1
	jne	.L28
.L22:
	mov	BYTE PTR [rdx], 0
	add	rsp, 8
	mov	eax, r8d
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	ret
	.size	get_line_from_console, .-get_line_from_console
	.section	.rodata.str1.1
.LC6:
	.string	"r"
	.text
	.p2align 4
	.globl	get_line_from_file
	.type	get_line_from_file, @function
get_line_from_file:
	push	r15
	push	r14
	push	r13
	push	r12
	mov	r12d, edx
	push	rbp
	xor	ebp, ebp
	push	rbx
	mov	rbx, rsi
	lea	rsi, .LC6[rip]
	sub	rsp, 8
	mov	rdi, QWORD PTR 8[rdi]
	call	fopen@PLT
	mov	r13, rax
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L38:
	cmp	ebp, r12d
	jge	.L32
.L30:
	mov	rdi, r13
	mov	r14d, ebp
	mov	r15, rbx
	add	ebp, 1
	call	fgetc@PLT
	add	rbx, 1
	mov	BYTE PTR -1[rbx], al
	cmp	eax, -1
	jne	.L38
.L32:
	mov	rdi, r13
	call	fclose@PLT
	mov	BYTE PTR [r15], 0
	add	rsp, 8
	mov	eax, r14d
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
	.size	get_line_from_file, .-get_line_from_file
	.p2align 4
	.globl	generate_str
	.type	generate_str, @function
generate_str:
	push	r12
	mov	r12d, esi
	push	rbp
	mov	rbp, rdi
	xor	edi, edi
	push	rbx
	call	time@PLT
	mov	rdi, rax
	call	srand@PLT
	test	r12d, r12d
	jle	.L40
	lea	eax, -1[r12]
	lea	rbx, 1[rbp+rax]
	.p2align 4,,10
	.p2align 3
.L41:
	call	rand@PLT
	add	rbp, 1
	mov	edx, eax
	cdqe
	imul	rax, rax, -1370734243
	mov	ecx, edx
	sar	ecx, 31
	shr	rax, 32
	add	eax, edx
	sar	eax, 6
	sub	eax, ecx
	imul	eax, eax, 94
	sub	edx, eax
	add	edx, 33
	mov	BYTE PTR -1[rbp], dl
	cmp	rbp, rbx
	jne	.L41
.L40:
	mov	eax, r12d
	pop	rbx
	pop	rbp
	pop	r12
	ret
	.size	generate_str, .-generate_str
	.ident	"GCC: (GNU) 10.3.0"
	.section	.note.GNU-stack,"",@progbits
