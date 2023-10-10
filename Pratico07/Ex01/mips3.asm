	.data
prompt1:.asciiz "Introduza um numero\n"
result: .asciiz "O fatorial do numero inserido é: "	
	.text
main:
	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0	#n = read_int()
	
	li $t1, 1	#f = 1
	la $t2, ($t0)	#i = n

for:	ble $t2, $0, done #if i <= 0
	
	mul $t1, $t1, $t2 # f = f*i
	subi $t2, $t2, 1  # i--	
	j for

done:	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	la $a0, ($t1)
	syscall
	
	li $v0, 10
	syscall
	
	
	
	
	

	