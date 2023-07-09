.globl _start
.text

_start:
	li t0, 10
	li t1, 0
	li t2, 1

while:
	bgt t2, t0, end_while
		mul t3, t2, t2
		add t1, t1, t3
		addi t2, t2, 1
		j while	
end_while:
end:
	addi x17, zero, 10
	ecall