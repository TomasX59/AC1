	.data 
	.text 
	.globl main 
	
	.eqv desl,1	#desl = 1

main: 
	li $t0,0x12345678 	# instru��o virtual (decomposta 
				# em duas instru��es nativas) 
				
	sll $t2,$t0,desl 	# shift left logical
	srl $t3,$t0,desl 	# shift right logical
	sra $t4,$t0,desl 	# shift right arithmetic
	jr $ra 			# fim do programa