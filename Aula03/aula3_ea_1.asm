# Mapa de registos:
# gray	:	$t0
# bin	:	$t1
# mask	: 	$t2	
	
	.data
str1:	.asciiz	"Introduza um numero: "
str2:	.asciiz	"\nValor em código de Gray: "
str3:	.asciiz	"\nValor em binario: "
	.eqv	print_int16,34
	.eqv	print_string,4
	.eqv	read_int,5	
	
	.text
	.globl main
	
main:	la	$a0,str1
	li	$v0,print_string	# print_string("Introduza um numero: ");
	syscall				
	
	li	$v0,read_int
	syscall
	ori	$t0,$v0,0			# gray = read_int(); 
	
	srl	$t2,$t0,1		# mask = gray >> 1; 
	addi	$t1,$t2,0		# bin = gray;
	
while:	beq	$t2,0,endwhile		# while(mask != 0){
	
	xor	$t1,$t1,$t2		#	bin = bin ^ mask;
	srl	$t2,$t2,1		# 	mask = mask >> 1; 
	
	j	while			#}
	
endwhile:
	la	$a0,str2
	li	$v0,print_string
	syscall
	
	move 	$a0,$t0
	li	$v0,print_int16
	syscall
	
	la	$a0,str3
	li	$v0,print_string
	syscall
	
	move 	$a0,$t1
	li	$v0,print_int16
	syscall
	
	jr	$ra