.globl _start
.data
	src: .string "12345"
	
.text
_start:
	la a0, src
	jal strlen
	li a7, 1
	ecall

_end:
	li a7, 10
	ecall
	
strlen:
	li t1, 0
	loop:
		lbu t2, 0(a0)
		beq t2, zero, endloop
		
		addi t1, t1, 1
		addi a0, a0, 1
		j loop
	endloop:
	add a0, zero, t1
	ret