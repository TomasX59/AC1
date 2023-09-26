#	$t0 =	bin
#	$t1 =  gray
	
	.data 
	.text 
	.globl main 
	
	.eqv val,2	# 	val = 1

main: 	li $t0,val		#	bin = val
	srl $t2,$t0,1		# 	bin >> 1
	xor $t1,$t0,$t2 	#	gray = bin XOR (bin >> 1)

	jr $ra 			# fim do programa
