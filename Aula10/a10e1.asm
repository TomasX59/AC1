	.data
ft1:	.float	1.0
str1:	.asciiz	"Digite a base B (float): "
str2: 	.asciiz	"Digite o expoente de B (inteiro): " 
str3:	.asciiz "\nB^E = "

	
	.text
	.globl main
main:				# int main (void)
	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	
	li	$v0,4
	la	$a0,str1
	syscall
	
	li	$v0,6
	syscall
	
	mov.s 	$f12,$f0
	
	li	$v0,4
	la	$a0,str2
	syscall
	
	li	$v0,5
	syscall
	move	$a0,$v0
	
	jal	xtoy
	
	li	$v0,4
	la	$a0,str3
	syscall
	
	li	$v0,2
	mov.s	$f12,$f0
	syscall
	
	li	$v0,0
	lw	$ra,0($sp)
	
	addiu	$sp,$sp,4

	jr 	$ra
	
########################################################
# x -> $f20; result -> $f22; i -> $s0; y -> $s1

xtoy:				# float xtoy(floatc, int y)
	addiu 	$sp,$sp, -20
	sw	$ra,0($sp)
	sw	$s0,4($sp)
	sw	$s1,8($sp)
	s.s	$f20,12($sp)
	s.s	$f22,16($sp)	##### end of prolog
	
	mov.s	$f20,$f12	
	move 	$s1,$a0
	li	$s0,0
	la	$t0,ft1
	l.s	$f22,0($t0)
	
xtoy_while:
	move 	$a0,$s1
	jal	abs
	bge	$s0,$v0,xtoy_endw
xtoy_if:
	blez	$s1,xtoy_else
	mul.s	$f22,$f22,$f20
	j	xtoy_endif
xtoy_else:
	div.s	$f22,$f22,$f20
	
xtoy_endif:
	
	addi	$s0,$s0,1
	j	xtoy_while

xtoy_endw:
	mov.s	$f0,$f22
	
	
	lw	$ra,0($sp)	##### begin of epilog
	lw	$s0,4($sp)
	lw	$s1,8($sp)
	l.s	$f20,12($sp)
	l.s	$f22,16($sp)
	addiu 	$sp,$sp, 20
	

	jr 	$ra
	
########################################################	
abs:
	bgez	$a0,abs_endif
	sub	$a0,$0,$a0
	
abs_endif:
	move	$v0,$a0
	jr 	$ra