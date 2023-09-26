	.data
	.text
	.globl main
	
	.eqv val, 0xE543
	
main:
	ori 	$t0,$0,val	# $t0 = val
	nor	$t1,$0,$t0	# $t1 = 0 NOR val
	
	jr $ra 	