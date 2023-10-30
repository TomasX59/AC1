# Mapa de registos
# i	:	$t0
# SIZE	:	$t3

	.eqv 	SIZE,3
	.eqv	print_string,4
	.eqv	print_char,11
	.data
array:	.word	str1,str2,str3
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
	.text
	.globl  main

main:	# pr�-condi��es do for:
	li	$t0,0		# i = 0
	li	$t3, SIZE	# SIZE = $t1	
	
	
	# condi��o de branch
for:	bge 	$t0, $t3,efor
	la	$t1, array
	sll	$t2, $t0, 2
 	addu 	$t2,$t2,$t1 	# $t2 = &array[i]
     	
     	lw 	$a0,0($t2) 	# $a0 = array[i]
     	ori 	$v0, $0, print_string
     	syscall  		# print_string('array[i]')
	
	
	li 	$a0,'\n'
	ori 	$v0,$0,print_char
	syscall 		# print_char('\n')


	# p�s condi��o
	addiu	$t0,$t0,1	# i++ 
	j	for
efor:
	jr	$ra
	