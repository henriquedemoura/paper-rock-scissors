	.file	"main.c"
	.text
	.globl	choices
	.section	.rodata
.LC0:
	.string	"Paper"
.LC1:
	.string	"Rock"
.LC2:
	.string	"Scissors"
	.section	.data.rel.local,"aw"
	.align 16
	.type	choices, @object
	.size	choices, 24
choices:
	.quad	.LC0
	.quad	.LC1
	.quad	.LC2
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
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$40, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movl	$0, -36(%rbp)
	movl	$0, -32(%rbp)
	movl	$0, -28(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	jmp	.L2
.L3:
	call	display_choices@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	get_input@PLT
	movl	%eax, -36(%rbp)
.L2:
	leaq	-36(%rbp), %rax
	movq	%rax, %rdi
	call	verify_input@PLT
	testl	%eax, %eax
	jne	.L3
	leaq	-32(%rbp), %rcx
	leaq	-36(%rbp), %rax
	leaq	choices(%rip), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	run_round_against_machine@PLT
	leaq	-32(%rbp), %rdx
	leaq	-36(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	announce_round_winner@PLT
	movl	%eax, -28(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	leave
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
