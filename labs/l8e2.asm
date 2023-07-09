.globl _start
.data

.text
_start:

	li a0, '/'
	jal digit
	
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
	