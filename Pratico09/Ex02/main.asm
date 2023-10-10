	.data
prompt:.asciiz "Introduz uma string:\n"
result:.asciiz "O tamanho da string é: "
str:   .space 20
	.text
	.globl main

main:	
	la $a0, prompt
	li $v0, 4
	syscall
	
	la $a0, str
	la $a1, 20
	li $v0, 8
	syscall
	
	jal strlen
	move $s0, $v0
	
	la $a0, result
	li $v0, 4
	syscall
	
	move $a0, $s0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall	


strlen:
	li $t3, 0	#n = 0
	li $t0, 0	#i = 0
	
while:	add $t1, $a0, $t0 #&(str[i]) = &(str[0]) + i*1
	lb $t2, 0($t1)	  #t2 = str[i]
	
	beq $t2, '\0', done	#if str[i] == '\0' go done
	beq $t2, '\n', done
	
	addi $t0, $t0, 1  #i++
	addi $t3, $t3, 1  #n++
	j while

done:
	move $v0, $t3
	jr $ra
