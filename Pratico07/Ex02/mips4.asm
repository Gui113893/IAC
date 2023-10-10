	.data
prompt1:.asciiz "\nIntroduza um numero: "
	.text
main:	
	li $t0, 0	#i = 0
	li $t1, 5	#n = 5
	li $t2, 0	#soma = 0
	
for:	bge $t0, $t1, done #if i >= 5 go done
	
	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	move $t3, $v0     # input = read_int()
	addi $t0, $t0, 1  # i++
	
	blt $t3, $0, else #if input < 0 go else
	
	add $t2, $t2, $t3 #soma = soma + input
	
	j for
	
	else:	j for
	
done:
	li $v0, 1
	la $a0, ($t2)
	syscall		#print_str(soma)
	
	li $v0, 10
	syscall
	
	



