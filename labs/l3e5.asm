# l3e5
.globl _start

.text

_start:
	addi x5, zero, 8
	addi x6, zero, 2
	
	add x5, x5, x6
	srai x5, x5, 1
	
exit: 
	addi x17, zero, 10
	ecall