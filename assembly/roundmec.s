	.file	"roundmec.c"
	.text
	.globl	verify_input
	.type	verify_input, @function
verify_input:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	je	.L2
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$2, %eax
	je	.L2
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$3, %eax
	je	.L2
	movl	$1, %eax
	jmp	.L4
.L2:
	movl	$0, %eax
.L4:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	verify_input, .-verify_input
	.section	.rodata
	.align 8
.LC0:
	.string	"Welcome to paper-rock-scissors!\n"
.LC1:
	.string	"What do you want to play?"
.LC2:
	.string	"1. Paper\n2. Rock\n3. Scissors"
	.text
	.globl	display_choices
	.type	display_choices, @function
display_choices:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	display_choices, .-display_choices
	.section	.rodata
.LC3:
	.string	"%s"
	.text
	.globl	get_input
	.type	get_input, @function
get_input:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movl	$0, -20(%rbp)
	movq	-40(%rbp), %rax
	movl	$8, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	call	__ctype_b_loc@PLT
	movq	(%rax), %rbx
	movq	-40(%rbp), %rax
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
	jne	.L7
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -20(%rbp)
	cmpl	$0, -20(%rbp)
	js	.L8
	cmpl	$3, -20(%rbp)
	jle	.L7
.L8:
	movl	$0, -20(%rbp)
.L7:
	movl	-20(%rbp), %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	get_input, .-get_input
	.section	.rodata
.LC4:
	.string	"You chose %s.\n"
.LC5:
	.string	"The machine chose %s!\n"
.LC6:
	.string	"[...]"
	.text
	.globl	run_round_against_machine
	.type	run_round_against_machine, @function
run_round_against_machine:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	call	rand@PLT
	movl	%eax, %ecx
	movslq	%ecx, %rax
	imulq	$1431655766, %rax, %rax
	shrq	$32, %rax
	movq	%rax, %rdx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	addl	$1, %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	run_round_against_machine, .-run_round_against_machine
	.section	.rodata
.LC7:
	.string	"Draw!"
.LC8:
	.string	"You win."
.LC9:
	.string	"You lose."
	.text
	.globl	announce_round_winner
	.type	announce_round_winner, @function
announce_round_winner:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jne	.L12
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L13
.L12:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L14
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	je	.L15
.L14:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L16
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$2, %eax
	je	.L15
.L16:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$2, %eax
	jne	.L17
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L17
.L15:
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L13
.L17:
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	movl	$-1, %eax
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	announce_round_winner, .-announce_round_winner
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
