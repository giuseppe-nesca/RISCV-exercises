.globl _start
.data
	in_string: .string "ciao"
.text
_start:
	la a0, in_string
	jal strupr

_end:
	li a7, 10
	ecall
	
strupr: # a0 = s
	add t0, a0, zero
	li a7, 11
	loop:
		lbu a0, (t0)
		beq a0, zero, endloop
		
		addi a0, a0, -32
		ecall
		
		addi t0, t0, 1
		j loop
	endloop:
	li a0, '\n'
	ecall
	ret
	
	
		
		
		
		