	.data
String:	.asciiz "Fim"
Break:	.asciiz "\n"
	.text
main:

	li $t0, 1
	li $t1, 21

while:	beq $t0, $t1, done

	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 4
	la $a0, Break
	syscall
	addi $t0, $t0, 1
	j while

done:	li $v0, 4
	la $a0, String
	syscall
	li $v0, 10
	syscall
	 
	