# Mapa de registos
# i		: 	$t0
# v		: 	$t1
# &(val[0])	: 	$t2

	.data
	.eqv	SIZE,8
	.eqv	print_string,4
	.eqv	print_int10,1
str:	.asciiz	"Result is: "
	.align 	2
val:    .word 	8,4,15,-1987,327,-9,27,16 	# 8 inteiros de 4 bytes
	.text
	.globl 	main
	
main:	
	li	$t1,0 		# i = 0;

do1:	# fazer v = val[i]
 	la	$t2,val		# $t2 = &val(0)
 	sll	$t9,$t0,2	# $t9 = i*4 		- register auxiliar
 	addu	$t3,$t2,$t9	# $t3 = &val[i]		- register auxiliar
 	lw	$t1, 0($t3)	# $t1: v = val[i]
 	
 	li 	$t4,SIZE	# $t4 = SIZE
 	sll	$t4,$t4,2	# $t4 = SIZE*4
 	srl	$t4,$t4,1	# $t4 = SIZE/2
 	
 	addu	$t5,$t1,$t4	# $t5 = &val[1+SIZE/2]
 	
 	lw	$t6,0($t5)	# $t6 = val[1+SIZE/2]	- register auxiliar
 	sw	$t6,0($t3)	# val[i] = val[i*SIZE/2]
 	
 	sw	$t1,0($t5)	# val[i+SIZE/2] = V
 	
 	# pré-while
 	addi	$t0,$t0,1
 	li	$t4,4		# porque SIZE/2 = 4
 	
while1:	blt	$t0,$t4,do1
	
	la	$a0,str
	ori 	$v0,$0,print_string
	syscall
	
	la	$t0,0
	
do2:
	# preparar val[i++]
	la	$t2, val	# $t2 = &val[0]
	sll	$t8,$t0,2 	# $t8 = i*4
	addu	$t7,$t2,$t8	# $t7 = &val[i]
	
	lw 	$t5, 0($t7)	# $t5: v = val[i]
    
    	move 	$a0, $t5
    	ori 	$v0, $0, print_int10
    	syscall 		#print_int10(val[i++])
    	
	li $a0, ','
    	ori $v0, $0, print_char
    	syscall #print_char(',')
    
    	addi $t0, $t0,1
    	
while2:    blt $t0, SIZE, do2
    
    	jr $ra
	
	
	
 	
 	
 	
 	
 	
 	
  
   
    

