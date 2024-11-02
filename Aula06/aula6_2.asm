# Mapa de registros:
# p		:	$t1
# pultimo	:	$t2

	.eqv	SIZE,3
	.eqv	print_string,4
	.eqv	print_char,11

	.data

array:	.word	str1,str2,str3
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
	.text
	.globl main

main:

	la 	$t1,array 		# $t1 = p = &array[0] = array 
	li	$t0,SIZE		#
	sll 	$t0,$t0,2 		#
 	addu 	$t2,$t1,$t0		# $t2 = pultimo = array + SIZE

for:	bge 	$t1,$t2,endfor

	ori	$v0,$0,print_string	#
	lw	$a0,0($t1)		#
	syscall
	
	ori 	$v0,$0,print_char
	li	$a0,'\n'
	syscall

	addi	$t1,$t1,4
	j 	for
endfor:
	jr	$ra
