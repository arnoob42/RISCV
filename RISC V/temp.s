	.file	"temp.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC2:
	.ascii "Mathematical Error!\0"
	.data
	.align 32
LC0:
	.long	1065353216
	.long	1073741824
	.long	1077936128
	.long	1082130432
	.long	1084227584
	.long	1086324736
	.long	1077936128
	.long	1073741824
	.long	1077936128
	.long	1082130432
	.long	1084227584
	.long	1077936128
	.long	1065353216
	.long	1073741824
	.long	1084227584
	.long	1082130432
	.long	1084227584
	.long	1086324736
	.long	1091567616
	.long	1073741824
	.long	1077936128
	.long	1088421888
	.long	1084227584
	.long	1091567616
	.long	1065353216
	.long	1091567616
	.long	1077936128
	.long	1082130432
	.long	1090519040
	.long	1086324736
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB7:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	andl	$-16, %esp
	subl	$192, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	call	___main
	movl	$5, 176(%esp)
	leal	48(%esp), %eax
	movl	$LC0, %ebx
	movl	$30, %edx
	movl	%eax, %edi
	movl	%ebx, %esi
	movl	%edx, %ecx
	rep movsl
	fldz
	fstps	28(%esp)
	fldz
	fstps	32(%esp)
	fldz
	fstps	36(%esp)
	fldz
	fstps	40(%esp)
	fldz
	fstps	44(%esp)
	fldz
	fstps	172(%esp)
	movl	$0, 188(%esp)
	jmp	L2
L9:
	movl	188(%esp), %eax
	imull	$28, %eax, %eax
	leal	192(%esp), %ecx
	addl	%ecx, %eax
	subl	$144, %eax
	flds	(%eax)
	fldz
	fucomp	%st(1)
	fnstsw	%ax
	sahf
	jp	L12
	fldz
	fucompp
	fnstsw	%ax
	sahf
	jne	L3
	movl	$LC2, (%esp)
	call	_puts
	movl	$0, (%esp)
	call	_exit
L12:
	fstp	%st(0)
L3:
	movl	188(%esp), %eax
	addl	$1, %eax
	movl	%eax, 184(%esp)
	jmp	L5
L8:
	movl	184(%esp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	188(%esp), %edx
	addl	%edx, %eax
	flds	48(%esp,%eax,4)
	movl	188(%esp), %eax
	imull	$28, %eax, %eax
	leal	192(%esp), %ebx
	addl	%ebx, %eax
	subl	$144, %eax
	flds	(%eax)
	fdivrp	%st, %st(1)
	fstps	168(%esp)
	movl	$0, 180(%esp)
	jmp	L6
L7:
	movl	184(%esp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	180(%esp), %edx
	addl	%edx, %eax
	flds	48(%esp,%eax,4)
	movl	188(%esp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	180(%esp), %edx
	addl	%edx, %eax
	flds	48(%esp,%eax,4)
	fmuls	168(%esp)
	fsubrp	%st, %st(1)
	movl	184(%esp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	180(%esp), %edx
	addl	%edx, %eax
	fstps	48(%esp,%eax,4)
	addl	$1, 180(%esp)
L6:
	movl	176(%esp), %eax
	addl	$1, %eax
	cmpl	180(%esp), %eax
	jg	L7
	addl	$1, 184(%esp)
L5:
	movl	184(%esp), %eax
	cmpl	176(%esp), %eax
	jl	L8
	addl	$1, 188(%esp)
L2:
	movl	188(%esp), %eax
	cmpl	176(%esp), %eax
	jl	L9
	movl	$0, %eax
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE7:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
