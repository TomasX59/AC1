#	Name		Alignment	Size		Offset
# int id_number		4		4		0
# char first_name[18]	1		18		4
# char last_name[15]	1		15		22
# float grade		4		4		37 > 40

	.data
	
	.eqv	id_number,0
	.eqv 	first_name,4
	.eqv	last_name,22
	.eqv	grade,40
	
	.data
	
str1:	.asciiz	"\nN. Mec: "
str2:	.asciiz	"\nNome: "
str3:	.asciiz	"\nNota: "
stg: 	.word	72343
	.asciiz	"Napoleao"
	.space 	9
	.asciiz "Bonaparte"
	.space	5
	.float	5.1
	
	.text
	.globl	main
	
main:
	la	$t0,stg			#	student *sp =&stg;
	
	li	$v0,4
	la	$a0,str1
	syscall				#	print_str(str1);
	
	lw	$a0,id_number($t0)	#		// atenta ao eqv!
	li	$v0,36
	syscall				#	print_int10(id_number);	
	
	li	$v0,4
	la	$a0,str2
	syscall				#	print_str(str2);
	
	addiu	$a0,$t0,last_name	
	li	$v0,4		
	syscall				#	print_str(stg.last_name);
	
	li	$v0,11
	la	$a0,','
	syscall
	
	addiu	$a0,$t0,first_name
	li	$v0,4
	syscall				#	print_str(stg.first_name);
	
	l.s	$f12,grade($t0)
	li	$v0,2
	syscall				#	print_float(stg.grade);
	
	li	$v0,0			#	return 0;
	jr	$ra
	
	