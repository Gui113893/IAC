	.data
	
SIZE:	.word 8
nums:	.word -2, 3, 6, 4, 8, 126, -131, 17
	.text

main:
	la $s0, 0 	#i = 0
	#lb $s1, SIZE	#s1 = SIZE	
	la $s2, nums	#s2 = &(nums[0])
	
for:	bge $s0, SIZE, done
	sll $t0, $s0, 2        #t0 = i*4
	add $t0, $t0, $s2      #&(nums[i]) = i*4 + &(nums[0])   
	lw $s3, 0($t0)	       #val = nums[i]
	

	andi $t1, $s3, 1
if:	bne $t1, 0, end_if
	move $a0, $s3
	li $v0, 1
	syscall
	
	li $a0, ','
	li $v0, 11
	syscall

end_if:
	addi $s0, $s0, 1	#i++
	j for
	
done:
	li $v0, 10
	syscall
	
	
	
