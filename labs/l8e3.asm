.globl _start
.data
	s: .string "0123_33345"
.text
_start:
	la a0, s
	jal isnumber
	
	li a7, 1
	ecall

_end: 
	li a7, 10
	ecall
	
digit: # a0: byte to check
	
	li t0, '0'
	blt a0, t0 not_digit
	li t0, '9'
	bgt a0, t0, not_digit
	li a0, 1
	ret
	
	not_digit:
	add a0, zero, zero
	ret

isnumber:
	addi sp, sp, -16
	sd ra, 0(sp)
	sd s3, 8(sp)
	add s3, a0, zero
	
	isnumber_loop:
		lbu a0, (s3)
		beq a0, zero, isnumber_end
		jal digit
		addi s3, s3, 1
		bne a0, zero, isnumber_loop
		j isnumber_false # return false	
		
	isnumber_end:
	li a0, 1
	isnumber_false:
	ld s3, 8(sp)
	ld ra, 0(sp)
	addi sp, sp, 16
	ret
		
		
		
		
	
	
