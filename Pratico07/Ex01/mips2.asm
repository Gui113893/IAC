	.data
prompt1:.asciiz "Introduza um numero\n"
	.text
main:	
	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $t1, 0 # i = 0
	
for:	slt $at, $t1, $t0 # i < a
	beq $at, $0, done
	
	li $a0, '-'
	li $v0, 11
	syscall
	
	addi $t1, $t1, 1 # i++
	j for

done:	li $v0, 10
	syscall
	  
	   
	    
	     
	      
	        