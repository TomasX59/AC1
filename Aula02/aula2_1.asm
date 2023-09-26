#	$t0 e $t1 = valores de entrada
#	$t2 = $t0 & $t1
#	$t3 = $t0 | $t1
#	$t4 = $t0 nor $t1
#	$t5 = $t0 xor $t1
	
	.data
	.text
	.globl main
	
	.eqv val_1, 0x5C1B
	.eqv val_2, 0xA3E4
	
	# b)
main: 	ori 	$t0,$0,val_1 	# substituir val_1 e val_2 pelos
 	ori 	$t1,$0,val_2 	# valores de entrada desejados

	# a)
 	and 	$t2,$t0,$t1 	# $t2 = $t0 & $t1 (and bit a bit)
 	or 	$t3,$t0,$t1	# $t3 = $t0 | $t1 (or bit a bit)
 	nor	$t4,$t0,$t1	# $t4 = $t0 nor $t1
 	xor	$t5,$t0,$t1	# $t5 = $t0 xor $t1
 	jr $ra 			# fim do programa
