	.data
str:	.asciiz "Ol�, Mundo!"

	.text
main:	la	$a0, str
	addi	$v0, $0, 4 #$v0 = 0+4
	syscall	
	addi $v0, $0, 10
	syscall	
	