.globl _start
.data
	v1: .word 1
	v2: .word 21
	v3: .word 3
	v4: .word 0
.text
_start:
	la t0, v1
	lw t1, 0(t0)
	lw t2, 4(t0)
	bge t1, t2, endif
		add t1, zero, t2
endif: 
	lw t2, 8(t0)
	bge t1, t2, endif2
		add t1, zero, t2
endif2:
	sw t1, 12(t0)
	
end:
	addi x17, zero, 10
	ecall
	