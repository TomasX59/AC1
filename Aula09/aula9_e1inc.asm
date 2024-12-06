	.data

f1:	.float	2.59375
f0:	.float	0.0

	.text
	.globl	main
main:
do:
	li 	$v0,5
	syscall
	move 	$t0,$v0
	mtc1	$t0,$f2
	cvt.s.w	$f2,$f2
	la	$f4,0($t9)
	mul.s	$f0,$f2,$f4
	


	li	$v0,0
	jr 	$ra