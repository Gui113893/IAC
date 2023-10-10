	.data
prompt1:.asciiz "Introduza um número: "
result: .asciiz "\nO fatorial do número "
result2:.asciiz " é: "
	.text
	.globl main
main:
	la $a0, prompt1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0	#n = read_int()
	
	la $a0, ($s1)
	jal fatorial
	move $s0, $v0	#f = fatorial(n)
	
	la $a0, result
	li $v0, 4
	syscall
	
	move $a0, $s1
	li $v0, 1
	syscall
	
	la $a0, result2
	li $v0, 4
	syscall
	
	move $a0, $s0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

fatorial: 
	move $t0, $a0	#i = num  
	li $s0, 1	#res = 1

for:	ble $t0, $0, done
	
	mul $s0, $s0, $t0 #res = res*i
	sub $t0, $t0, 1	  #i--
	j for
done:
	move $v0, $s0
	jr $ra