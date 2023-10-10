	.data
	.text
	
strcat:
	move $s0, $a0	#aux = dst
	
	lb $t0, ($a0)	#t0 = *dst
	
while:	beq $t0, '\0', done
	beq $t0, '\n', done
	
	addiu $a0, $a0, 1 #dst++ 
	j while
	
done:	
	jal strcopy
	move $v0, $s0
	jr $ra	
			
strcopy:
	li $t0, 0 #i = 0
	
while:	addu $t1, $a1, $t0 #&(src[i]) = &(src[0]) + i
	lb $t2, ($t1)	  #t2 = src[i]
	
	beq $t2, '\0', end_while
	beq $t2, '\n', end_while
	
	addu $t3, $a0, $t0 #&(dst[i]) = &(dst[0]) + i
	sb $t2, 0($t3)    #dst[i] = src[i]
	
	addi $t0, $t0, 1 #i++
	j while
		
end_while:
	addu $t3, $a0, $t0 #&(dst[i]) = &(dst[0]) + i
	li $t5, '\0'       #t5 = '\0'
	sb $t5, 0($t3)	   #dist[i] = '\0'
	move $v0, $a0
	jr $ra	
	
	
	
