.globl _start

.text

_start:
	
	addi t0, zero, 6
	addi t1, zero, 10
	
	sub t0, t0, t1
if:	bge t0, zero, endif
		addi t0, zero, 0
endif:	
	addi t1, t1, -1
end:
	addi x17, x0, 10
	ecall