	# .file	"C2Risc.c"
	# .def	___main;	.scl	2;	.type	32;	.endef
	# .section .rdata,"dr"
	
LC2:
	.ascii "Mathematical Error!\0"
LC3:
	.ascii "\12Solution:\0"
LC4:
	.ascii "x[%d] = %0.10f\12\0"
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
LFB14:
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
	movl	$5, 168(%esp)
	leal	44(%esp), %eax
	movl	$LC0, %ebx
	movl	$30, %edx
	movl	%eax, %edi
	movl	%ebx, %esi
	movl	%edx, %ecx
	rep movsl
	fldz
	fstps	24(%esp)
	fldz
	fstps	28(%esp)
	fldz
	fstps	32(%esp)
	fldz
	fstps	36(%esp)
	fldz
	fstps	40(%esp)
	fldz
	fstps	180(%esp)
	movl	$0, 188(%esp)
	jmp	L2
L9:
	movl	188(%esp), %eax
	imull	$28, %eax, %eax
	leal	192(%esp), %ecx
	addl	%ecx, %eax
	subl	$148, %eax
	flds	(%eax)
	fldz
	fucomp	%st(1)
	fnstsw	%ax
	sahf
	jp	L18
	fldz
	fucompp
	fnstsw	%ax
	sahf
	jne	L3
	movl	$LC2, (%esp)
	call	_printf
	movl	$0, (%esp)
	call	_exit
L18:
	fstp	%st(0)
L3:
	movl	188(%esp), %eax
	addl	$1, %eax
	movl	%eax, 176(%esp)
	jmp	L5
L8:
	movl	176(%esp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	188(%esp), %edx
	addl	%edx, %eax
	flds	44(%esp,%eax,4)
	movl	188(%esp), %eax
	imull	$28, %eax, %eax
	leal	192(%esp), %ebx
	addl	%ebx, %eax
	subl	$148, %eax
	flds	(%eax)
	fdivrp	%st, %st(1)
	fstps	164(%esp)
	movl	$0, 172(%esp)
	jmp	L6
L7:
	movl	176(%esp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	172(%esp), %edx
	addl	%edx, %eax
	flds	44(%esp,%eax,4)
	movl	188(%esp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	172(%esp), %edx
	addl	%edx, %eax
	flds	44(%esp,%eax,4)
	fmuls	164(%esp)
	fsubrp	%st, %st(1)
	movl	176(%esp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	172(%esp), %edx
	addl	%edx, %eax
	fstps	44(%esp,%eax,4)
	addl	$1, 172(%esp)
L6:
	movl	168(%esp), %eax
	addl	$1, %eax
	cmpl	172(%esp), %eax
	jg	L7
	addl	$1, 176(%esp)
L5:
	movl	176(%esp), %eax
	cmpl	168(%esp), %eax
	jl	L8
	addl	$1, 188(%esp)
L2:
	movl	188(%esp), %eax
	cmpl	168(%esp), %eax
	jl	L9
	movl	168(%esp), %eax
	subl	$1, %eax
	movl	%eax, 188(%esp)
	jmp	L10
L13:
	fldz
	fstps	180(%esp)
	movl	168(%esp), %eax
	subl	$1, %eax
	movl	%eax, 184(%esp)
	jmp	L11
L12:
	movl	184(%esp), %eax
	flds	24(%esp,%eax,4)
	movl	188(%esp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	184(%esp), %edx
	addl	%edx, %eax
	flds	44(%esp,%eax,4)
	fmulp	%st, %st(1)
	flds	180(%esp)
	faddp	%st, %st(1)
	fstps	180(%esp)
	subl	$1, 184(%esp)
L11:
	movl	184(%esp), %eax
	cmpl	188(%esp), %eax
	jg	L12
	movl	188(%esp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	168(%esp), %edx
	addl	%edx, %eax
	flds	44(%esp,%eax,4)
	fsubs	180(%esp)
	movl	188(%esp), %eax
	imull	$28, %eax, %eax
	leal	192(%esp), %esi
	addl	%esi, %eax
	subl	$148, %eax
	flds	(%eax)
	fdivrp	%st, %st(1)
	movl	188(%esp), %eax
	fstps	24(%esp,%eax,4)
	subl	$1, 188(%esp)
L10:
	cmpl	$0, 188(%esp)
	jns	L13
	movl	$LC3, (%esp)
	call	_puts
	movl	$0, 188(%esp)
	jmp	L14
L15:
	movl	188(%esp), %eax
	flds	24(%esp,%eax,4)
	fstpl	8(%esp)
	movl	188(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	addl	$1, 188(%esp)
L14:
	movl	188(%esp), %eax
	cmpl	168(%esp), %eax
	jl	L15
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
LFE14:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
