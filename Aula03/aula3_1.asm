# Mapa de registos:
# soma: $t0
# value: $t1
# i: $t2

	.eqv 	print_string, 4
	.eqv	print_int, 1
	.eqv 	read_int, 5


	.data
str1: 	.asciiz "Introduza um numero: "
str2: 	.asciiz "Valor ignorado\n"
str3: 	.asciiz "A soma dos positivos é: "
	
	.text
	.globl main
	
main: 	li 	$t0, 0		# soma = 0;
	li	$t2, 0		# i = 0;
	
for:	bge 	$t2, 5, endfor	# while(i < 5){

	la	$a0, str1
	li	$v0, 4
	syscall			# 	print_string(str1);
	
	li 	$v0, 5
	syscall			# 	read_int;
	move 	$t1,$v0		# 	Value = read_int();
	
	ble	$t1,$0,else	# 	if(value > 0)
	add	$t0, $t0, $t1	# 		soma += value;
	j	else
	
else:	la	$a0, str2	#	else
	li	$v0, 4
	syscall			# 		print_string(str2);
	
endif:	addi	$t2, $t2,1	#		i++;
	j 	for		# }
	
endfor:	la	$a0, str3
	li	$v0, 4
	syscall			# print_string(str3);
	
	move	$a0, $t0
	li	$v0, 1
	syscall			# print_int10(soma);
	
	jr	$ra