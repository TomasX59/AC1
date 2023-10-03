#	$t0 =	bin
#	$t1 =  	gray
#	$t2 = 	num
#	$t3 = 	var temporária
#	$t4 = 	bin
	
	.data 
	.text 
	.globl main 
	
	.eqv val,2		# 	val = ... -> 2

main: 	li $t1,val		# 	gray value
	or $t2,$0,$t1		# 	num = gray;
	srl $t3,$t2,4		# 	num >> 4;
	xor $t2,$t2,$t3		#	num = num XOR (bin >> 4);
	
	srl $t3,$t2,2		# 	num >> 2;
	xor $t2,$t2,$t3		#	num = bin XOR (bin >> 2);
	
	srl $t3,$t2,1		# 	num >> 1;
	xor $t2,$t2,$t3		#	num = bin XOR (bin >> 1);
	
	or $t4,$0,$t2		#	bin = num;
	
	jr $ra 			# 	fim do programa	
