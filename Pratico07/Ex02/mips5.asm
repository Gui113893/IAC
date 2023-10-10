	.data
prompt1:.asciiz "Introduza um numero: "
result: .asciiz "\n O numero em binario é: "
	.text
main:	
	li $t0, 0	#n = 0
	li $t1, 32	#t1 = 32

	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0	#num = read_int()
	
	li $v0, 4
	la $a0, result
	syscall
	
for:	bge $t0, $t1, done #if n >= 32 go done
	
	addi $t0, $t0, 1   #n++
	
	andi $t4, $t2, 0x80000000 #num & 0x80000000
	srl $t3, $t4, 31	  #shift >> 31
	li $v0, 1
	la $a0, ($t3)
	syscall
	
	sll $t2, $t2, 1     #num = num << 1
	j for

done:
	li $v0, 10
	syscall
			
				
					
						
							
								
									
										
											
												
													
														
																
