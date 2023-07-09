.globl _start
.data
x: .word 5
vettx: 1, 2, 3, 4, 5
result: .word 0
.text
_start:
la t0, x # address
lw t1, 0(t0) #to read
li a0, 0 # result

loop:
beq t1, zero, endloop
	addi t0, t0, 4
	lw t2, 0(t0)
	add a0, a0, t2
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