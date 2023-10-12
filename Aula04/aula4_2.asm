#	Mapa de registos 
# 	num	: 	$t0 
# 	p	: 	$t1 
# 	*p	: 	$t2 (Registo temporário para guardar o valor 
#				armazenado na posição de memória p) 
 	.data 
 
 	.eqv 	SIZE,20
	.eqv 	read_string, 8
	.eqv 	print_int10, 1
	
str: 	.space 	21		# static char str[SIZE+1];
	
 	.text 
 	.globl main 

main: 	
	la 	$a0,str           
    	li 	$a1,SIZE 	# $a1=SIZE
    	li 	$v0,read_string
    	syscall 		# read_string(str,SIZE)
     	
     	li 	$t0,0    	# num=0; 
     	la 	$t1,str    	# p = str

while: 				# while(*p != '\0') 
 	lb 	$t2,0($t1) 	# $t2 = *p
 	beq 	$t2,'\0',endw 	# { 
 	blt 	$t2,'0',endif 	# if(str[i] >='0' && 
 	bgt 	$t2,'9',endif 	# str[i] <= '9') 
 	addi 	$t0,$t0,1 	# num++; 
 		
endif: 
 	addi 	$t1,$t1,1	# p++; 
 	 			# }
 	j	while 			 
endw: 	move 	$a0,$t0		# print_int10(num);
	ori 	$v0,$0,print_int10	# (instrução virtual) 
 	syscall  			# print_int10(num);
 
 	jr 	$ra 			# termina o programa 
