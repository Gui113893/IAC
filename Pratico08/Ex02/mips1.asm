	.data
minus:	.asciiz "123texto em minusculas"
maius:	.space 20	
	.text
	.globl main
	
main:
	la $t0, minus	#endereço base minus
	la $t4, maius	#endereço base maius
	li $t1, 0	# i = 0


while:	add $t2, $t0, $t1 #endereço minus[i] = minus[0] + i
	add $t5, $t4, $t1 #endereço maius[i] = maius[0] + i
	lb $t3, 0($t2)	  #t3 = minus[i]
	addi $t1, $t1, 1       #i++

	beq $t3, '\0', end	#if minus[i] == '\0' go end
	blt $t3, 'a', else	#if minus[i] < 'a' go else
	bgt $t3, 'z', else	#if minus[i] > 'z' go else

	addi $t3, $t3, -32  #minus[i] = minus[i] - 32
	sb  $t3, 0($t5)     #maius[i] = minus[i]
	j while

else:
	sb  $t3, 0($t5)		#maius[i] = minus[i] 
	j while
  	
end:	
	la $a0, maius
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall
	
	

	

	

	
	
