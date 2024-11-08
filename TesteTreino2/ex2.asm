# Mapa de registos
# $t0	:	i
# $t1	:	v

	
	.data
	
	.eqv	SIZE,8
	.eqv	print_int10,1
	.eqv	print_string,4
	.eqv	print_char,11
	
val:	.word	8,4,15,-1987,327,-9,27,16
str:	.asciiz	"Result is: "
	
	.text
	.globl main
	
main:	li 	$t0,0			# i = 0;

do:	la	$t2,val			# $t2 = &val[0]
	sll	$t9,$t0,2		# $t9 = i*4
	addu 	$t3,$t2,$t9		# $t3 = &val[i]
	lw 	$t2,0($t3)		# $t2 = val[i]
	
	move 	$t1,$t2			# v = val[i];
	
	li 	$t4,SIZE		# $t4 = SIZE = 8
	sll	$t4,$t4,2		# SIZE*4 -> (new SIZE)
	srl	$t4,$t4,1		# SIZE/2
	addu	$t5,$t3,$t4		# $t5 = &val[i+SIZE/2]
	lw 	$t6,0($t5)		# $t6 = val [i+SIZE/2]
	
    	sw 	$t6, 0($t3)        # val[i] = val[i + SIZE / 2];
    	sw 	$t1, 0($t5)        # val[i + SIZE / 2] = v;
	
	addi 	$t0,$t0,1
	bge	$t0,4,endDo
	j	do
endDo:	
	li	$v0,print_string
	la	$a0,str
	syscall
	
	li $t0, 0 
do1:		
	la	$t2,val
	sll	$t9,$t0,2
	addu	$t3,$t2,$t9
	lw	$t2,0($t3)
	
	li	$v0,print_int10
	move	$a0,$t2
	syscall
	
	addi	$t0,$t0,1
	
	li	$v0,print_char
	li	$a0,','
	syscall	
	
	
	bge	$t0,SIZE,endDo1
	j	do1
	
endDo1:
	jr	$ra
