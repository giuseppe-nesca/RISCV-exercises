.globl _start
.text

_start:
	li t0, 8 # N
	li t1, 1 # R result
	li t2, 0 # A
	li t3, 1 # B

while: 
	beq t0, zero, end_while
		add t1, t2, t3
		add t2, zero, t3
		add t3, zero, t1
		addi t0, t0, -1
		j while
end_while:
	
	
end:
	addi x17, zero, 17
	ecall
