	.data
prompt1:.asciiz "Introduza um numero\n"
strpar: .asciiz "O numero é par\n"
strimp: .asciiz "O numero é impar\n"
	.text
main:
	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $t1, 1
	and $t2, $t1, $t0 
	bne $t2, $0, else
	li $v0, 4
	la $a0, strpar
	syscall
	
	j end
	
else:	li $v0, 4
	la $a0, strimp
	syscall

end: 	li $v0, 10
	syscall
	
	
	
	