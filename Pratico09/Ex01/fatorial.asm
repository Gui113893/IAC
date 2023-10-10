	.text

fatorial: 
	move $t0, $a0	#i = num  
	li $t1, 1	#res = 1

for:	ble $t0, $0, done
	
	mul $t1, $t1, $t0 #res = res*i
	sub $t0, $t0, 1	#i--
	j for
done:
	move $v0, $t1
	jr $ra
	
