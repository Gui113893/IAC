	.data
prompt1:.asciiz "Introduza dois n�meros:"
prompt2:.asciiz "A soma dos n�meros �: "
	.text

main:	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 4
	la $a0, prompt2
	syscall
	
	li $v0, 1
	add $a0, $t1, $t0
	syscall
	
	li $v0, 10
	syscall
	
	
	
