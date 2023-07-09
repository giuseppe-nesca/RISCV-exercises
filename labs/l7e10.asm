.globl _start

.data

.text
_start:

	li a0, 23
	jal fib
	
	li a7, 1
	ecall


_end:
	li a7, 10
	ecall
	
fib: # a0=n
	addi sp, sp, -24
	sd ra, 0(sp)
	
	li t1 ,1

	beq a0, zero, fib_end
	beq a0, t1, fib_end
		
	sd s0, 8(sp)
	sd s1, 16(sp)
	
	add s0, a0, zero
	
	addi a0, s0, -1
	jal fib
	add s1, a0, zero
	addi a0, s0, -2
	jal fib
	add a0, a0, s1
	
	ld s1, 16(sp)
	ld s0, 8(sp)
	
	fib_end:
	ld ra, 0(sp)
	addi sp, sp 24
	ret
		
		
	