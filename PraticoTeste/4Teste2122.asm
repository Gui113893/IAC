	.text
	
print_fact:

	li $s0, 0 # i = 0
	move $s1, $a0  #s1 = n
	
if:	bge $s1, $0, else   #if n >= 0 go else
	li $v0, -1	   
	jr $ra		    #return -1
	
else:	
for:	bgt $s0, $s1, done  #if i > n go done
	move $a0, $s0
	jal fatorial	    #fatorial(i)
	
	move $a0, $v0
	li $v0, 1
	syscall		    #print_int10(fatorial(i))
	
	addi $s0, $s0, 1    #i++
	j for

done:
	li $v0, 1
	jr $ra

