.globl _start
.data
x: .word 5
vettx: 1, 2, 22, 4, 6
result: .word 0
.text
_start:
la t0, x # address
lw t1, 0(t0) #to read
li a0, 0 # result
li t3, 1 # mask

loop:
beq t1, zero, endloop
	addi t0, t0, 4
	lw t2, 0(t0)
	and t2, t2, t3
	bne t2, t3, skip
		addi a0, a0, 1
	skip:
	addi t1, t1, -1
	j loop
endloop:
la t0, result
sw a0, 0(t0)
li a7, 1
ecall

.end
addi x17, zero, 10
ecall