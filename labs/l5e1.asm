.globl _start

.data
	v1: .word 1
	v2: .word 2
	v3: .word 3
	v4: .word 4
	v5: .word 0
	
.text
_start:
	la t0, v1
	lw t1, 0(t0)
	lw t2, 4(t0)
	lw t3, 8(t0)
	lw t4, 12(t0)
	
	add t1, t1, t2
	add t1, t1, t3
	add t1, t1, t4
	
	srli t1, t1, 2
	
	sw, t1, 16(t0)


end:
	addi x17, zero, 10
	ecall