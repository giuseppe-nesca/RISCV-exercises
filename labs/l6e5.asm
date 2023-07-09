.globl _start
.data
	str: .string "my long string"
	char: .string "h"
.text
_start:
	la a0, str
	la t0, char
	lbu a1, 0(t0)
	jal strchr
	li a7 1
	ecall	

_end:
	li a7, 10
	ecall

		
strchr:
	
	loop:
		lbu t0, 0(a0)
		beq t0, zero, endnoaddress
		
		beq t0, a1, endwithaddress
		addi a0, a0, 1
		j loop
	
	endnoaddress:
		li a0, 0
	endwithaddress:
		ret
		
		
	