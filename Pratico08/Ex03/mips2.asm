	.data
prompt1:.asciiz "Introduza uma string\n"
result: .asciiz "O número de carateres numéricos: "
str:	.space 40
	.text
	.globl main
main:
	li $t0, 0	#i = 0
	li $t1, 0	#n = 0
	
	la $a0, prompt1
	li $v0, 4
	syscall
	
	li $v0, 8
	la $a0, str	#a0 = string
	li $a1, 40
	syscall
	
	la $s1, str	# &(str[0])
	
for:	add $t2, $s1, $t0 #&(str[i]) = &(str[0]) + i*1
	lb $t3, 0($t2)	  #t3 = str[i]
	
	beq $t3, '\0', end
	
if:	blt $t3, '0', else
	bgt $t3, '9', else
	
	addi $t1, $t1, 1 #n++
	
else:
	addi $t0, $t0, 1  #i++
	j for
end:
	la $a0, result
	li $v0, 4
	syscall
	
	move $a0, $t1
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
	
	
	
	
	
	
