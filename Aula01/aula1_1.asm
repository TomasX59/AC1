	.data
				# nada a colocar aqui, de momento
	.text
	.globl main
				# $t1 � y
main: 
#	ori $t0,$0,3 		# $t0 = x (substituir val_x pelo valor de x pretendido) 
				# neste caso x = 3
				# as anteriores linhas forma comentadas para o exerc�cio 3
				
	ori $v0,$0,5 		# a system call read_int() � 
 				# identificada com o n�mero 5 (ver 
 				# tabela de instru��es) 
 	syscall 		# a system call read_int() � chamada
 	or 	$t0,$0,$v0
				
	ori 	$t2,$0,8 	# $t2 = 8
	add 	$t1,$t0,$t0 	# $t1 = $t0 + $t0 = x + x = 2 * x -- ou seja -- y = 2x
	sub 	$t1,$t1,$t2 	# $t1 = $t1 - $t2 = y = 2 * x - 8 -- ou seja -- y = 2x - 8 	#	Exerc�cio 2 
#	add 	$t1,$t1,$t2 	# $t1 = $t1 + $t2 = y = 2 * x + 8 				#	Substitu�do no exerc�cio 2 pela linha anterior
				
# EXERC�CIO 3 -- DAR PRINT

	or 	$a0, $0, $t1	# $a0 = y
	
#_____________________________________
	ori 	$v0, $0, 1	# a) $v0 = 1 -> void print_int10(int value)
#	ori 	$v0, $0, 34	# b) $v0 = 1 -> void print_int16(int value)
#	ori 	$v0, $0, 36	# c) $v0 = 1 -> void print_int10(int value)
#_____________________________________	
	
	syscall			# chamada ao syscall 	
	
	jr $ra 			# fim do programa