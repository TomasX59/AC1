# Mapa de registos
# $t0	: 	val
# $t1	:	n
# $t2	:	min
# $t3	:	max
	.data
str1:	.asciiz	"Digite ate 20 inteiros (zero para terminar): "
str2:	.asciiz	"Máximo/mínimo são: "		

	
	.text
	.globl main
	
main:
	li 	$t1,0
	li	$t2,0x7FFFFFFF
	li	$t3,0x80000000
	
	li	$v0,4
	la 	$a0,str1
	syscall
	
doWhile:
	li	$v0,5
	syscall
	move	$t0,$v0
	
if:	beq	$t0,0,endif

if1:	ble 	$t0,$t3,endif1
	move 	$t3,$t0
endif1:

if2:	bge 	$t0,$t2,endif2
	move 	$t2,$t0

endif2:
endif:
	
	addi	$t1,$t1,1
	
	bge	$t1,20,doWhileEnd
	beq	$t0,0,doWhileEnd
	j	doWhile
doWhileEnd:
	
	li	$v0,4
	la	$a0,str2
	syscall
	
	li	$v0,1
	move	$a0,$t3
	syscall
	
	li 	$v0,11
	li	$a0,':'
	syscall
	
	li	$v0,1
	move	$a0,$t2
	syscall
	
	jr 	$ra