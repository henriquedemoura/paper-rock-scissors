	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"Paper"
.LC1:
	.string	"Rock"
.LC2:
	.string	"Scissors"
.LC3:
	.string	"%s"
.LC4:
	.string	"DEBUG: Round_point: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$40, %edi
	call	malloc@PLT
	movq	%rax, -56(%rbp)
	movl	$0, -76(%rbp)
	movl	$0, -72(%rbp)
	leaq	.LC0(%rip), %rax
	movq	%rax, -48(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, -40(%rbp)
	leaq	.LC2(%rip), %rax
	movq	%rax, -32(%rbp)
	movl	$0, -68(%rbp)
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	jmp	.L2
.L4:
	call	display_choices@PLT
	call	__ctype_b_loc@PLT
	movq	(%rax), %rbx
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cltq
	addq	%rax, %rax
	addq	%rbx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$2048, %eax
	testl	%eax, %eax
	jne	.L2
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -76(%rbp)
	movl	-76(%rbp), %eax
	testl	%eax, %eax
	js	.L3
	movl	-76(%rbp), %eax
	cmpl	$3, %eax
	jle	.L2
.L3:
	movl	$0, -76(%rbp)
.L2:
	leaq	-76(%rbp), %rax
	movq	%rax, %rdi
	call	verify_input@PLT
	testl	%eax, %eax
	jne	.L4
	leaq	-48(%rbp), %rdx
	leaq	-72(%rbp), %rcx
	leaq	-76(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	run_round_against_machine@PLT
	leaq	-72(%rbp), %rdx
	leaq	-76(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	announce_round_winner@PLT
	movl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	movq	-24(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
