# Mapa de registos
# i		:	$t0
# j		:	$t1
# array[i][j]	:	$t3	
	.data
	.eqv	SIZE,3
	.eqv	print_int10,1
	.eqv	print_string,4
	.eqv	print_char,11
array:	.word 	str1,str2,str3
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
str4: 	.asciiz	"\nString #"
str5:	.asciiz ": "
	.text
	.globl main
	
main:
	la	$t3,array		# $t3 = &array[0]
	sll	$t2,$t0,2		# escolher a string -> i*4
	addu	$t3,$t3,$t2		# $t3 = &array[0] + i*4 -> &array[i]
	lw 	$t3,0($t3)		# $t3 = array[i] = &array[i][0]
	addu 	$t3,$t3,$t1		# $t3 = &array[i][j]
	lb 	$t3,0($t3)		# $t3 = array[i][j]
	
	li	$t0,0
for: 	bge	$t0,SIZE,endfor
	
	la	$a0,str4
	ori	$v0,$0,print_string
	syscall	
	
	li	$v0,print_int10
	move 	$a0, $t0
	syscall
	
	li	$v0,4
	la	$a0,str5
	syscall
	
while:	beq	$t2,'\0',endwhile
	
	li	$v0,print_char
	move	$a0,$t2
	syscall
	
	li	$v0,print_char
	li	$a0,'-'
	syscall
	

	addi 	$t1,$t1,1
	j	while
endwhile:



	addi 	$t0,$t0,1
	j	for
endfor:
	jr	$ra
	