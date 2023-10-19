# Mapa de registos 
# 	p		: 	$t0 
# 	*p		:  	$t1  (Registo temporário para guardar o valor armazenado em memória) 
# 	lista+Size	:	$t2 

 	.data 
str1: 	.asciiz "; " 
str2: 	.asciiz "\nConteudo do array:\n" 
lista:	.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15	
	# a diretiva ".word" alinha num endereço 
	# múltiplo de 4 
 	.eqv print_int10,1 
 	.eqv print_string,4 
 	.eqv SIZE,10 
 	.text 
 	.globl main 

main:	#	print_string("\nConteudo do array:\n")
	la 	$a0, str2
	li 	$v0, print_string
	syscall
	
	#	pré-condições do FOR
	la	$t0,lista	# p = lista
	li 	$t2,SIZE 	# $t2 = SIZE
     	sll 	$t2,$t2,2 	# SIZE * 4 (cada valor ocupa 4 bytes)
     	addu 	$t2,$t0,$t2 	# $t2 = lista + SIZE;
	
for: 	bge	$t0, $t2, endfor	# Condição do salto do FOR
	
	#	print_int10( *p )
	lw	$t1, 0($t0)		# $t1 = *P
	move	$a0, $t1 
	li	$v0, print_int10
	syscall	
	
	#	print_string("; ")
	la 	$a0, str1
	li 	$v0, print_string
	syscall		
	
	#  condição para o avanço do FOR
	addiu	$t0,$t0,4
	j	for	
	
endfor:	jr	$ra
