.globl _start

.text

_start:
	addi t0, zero, 1
	addi t1, zero, 2
	
	addi t0, t0, -2
	add t0, t0, t1
if:	bge t0, t1, else
		addi t0, t0, 1
		j endif
else: 	addi t1, t1, 1
endif:	
	
end: 
	addi x17, zero, 10
	ecall