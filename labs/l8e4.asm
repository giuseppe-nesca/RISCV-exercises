.globl _start
.data
	str: .string "18"
.text

_start:
	la a0, str
	jal isnumber
	beq a0, zero, _end
	
	la a0, str
	jal strlen
	mv a1, a0
	la a0, str
	
	jal atoi
	
	mul a0, a0, a0
	
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
		
		
strlen:
 add t0, zero, zero # i = 0
 # Start of for loop
strlen_loop:
 add t1, t0, a0 # Add the byte offset for str[i]
 lbu t1, 0(t1) # Dereference str[i]
 beq t1, zero, strlen_end # if str[i] == 0, break for loop
 addi t0, t0, 1 # i++
 j strlen_loop # loop
strlen_end:
 addi a0, t0, 0 # Move t0 into a0 to return
 ret			


atoi: # a0: *str, a1: lenght
	li t1, 1
	bne a1, t1, not_one
	lbu a0, (a0)
	addi a0, a0, -48
	ret
	
	not_one:
	addi sp, sp, -24
	sd ra,  0(sp)
	sd s0, 8(sp)
	sd s1, 16(sp)
	
	add s0, a0, zero
	addi s1, a1, -1
	add a1, s1, zero
	
	jal atoi
	li t0, 10
	mul a0, a0, t0
	
	add s0, s0, s1
	lbu s0, (s0)
	addi s0, s0, -48
	add a0, a0, s0
	
	ld s1, 16(sp)
	ld s0, 8(sp)
	ld ra, 0(sp)
	addi sp, sp, 24
	ret
	
	
	
	
	
	
	
	
