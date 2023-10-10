	.data
frase:	.asciiz "Te3m In5tei1ros Mis8tura9dos"
msg:	.asciiz "\n0 nr de Alfas é: "
	.text

main:
	la $a0, msg	#print_str(msg)
	li $v0, 4
	syscall
	
	la $a0, frase	
	jal n_alphas	
	
	move $a0, $v0	#n = n_alphas(frase)
	li $v0, 1
	syscall		#print_int10(n)
	
	li $v0, 10	#exit()
	syscall
		
n_alphas:
	li $v0, 0	#alfas = 0
	li $t0, 0	#i = 0
	
for:	add $t1, $a0, $t0  #&(str[i]) = &(str[0]) + i*1
	lb $t2, 0($t1)	   #t2 = str[i]
	beq $t2, '\0', done
	
if:	blt $t2, 'A', end_if
	bgt $t2, 'z', end_if

	addi $v0, $v0, 1    #alfas++

end_if:	addi $t0, $t0, 1   #i++
	j for

done:
	jr $ra    #return alfas
		