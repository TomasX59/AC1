# Mapa de registos:
# $t0	:	argc
# $t2	:	argv[i]
# $t3	:	i
	.data
str1:	.asciiz	"Nr. de parametros: "
str2:	.asciiz "\nP"
str3:	.asciiz	": "
	
	.eqv	print_int10,1
	.eqv	print_string,4
	
	.text
	.globl main
	
main:	move 	$t0,$a0
	move 	$t1,$a1


	la 	$a0,str1
	li 	$v0,print_string
	syscall
	
	li	$v0,print_int10
	move	$a0,$t0
	syscall
	
	li	$t3,0
for:	bge	$t3,$t0,endfor

	la	$a0,str2
	li	$v0,print_string
	syscall
	
	li	$v0,print_int10
	move	$a0,$t3
	syscall
	
	la	$a0,str3
	li	$v0,print_string
	syscall
	
	sll	$t4,$t3,2
	addu	$t4,$t4,$t3
	lw	$a0,0($t4)
	
	li 	$v0,print_string
	syscall
	
	
	addi	$t3,$t3,1
	j for
endfor:
	jr	$ra
	