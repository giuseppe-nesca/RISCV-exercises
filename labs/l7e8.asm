.globl _start
.data
	v: .word 1 2 3 4 5
	size: .word 5
.text
_start:
	la a1 , size
	lw a1, (a1)
	la a0, v
	
	jal print
	
	la a1 , size
	lw a1, (a1)
	addi a1, a1, -1
	la a0, v
	jal invert
	
	la a1 , size
	lw a1, (a1)
	la a0, v
	jal print


_end:
	li a7, 10
	ecall

print: # a0 = v, a1 = size
	add t1, zero, zero
	add t0, a0, zero
	li a7, 1
	slli a1, a1, 2
	printloop:
		bge t1, a1, endprint
		add t2, t0, t1
		lw a0, (t2)
		ecall
		addi t1, t1, 4
		j printloop
	endprint:
	ret
		
	

swap: # a0=v, a1=x , a2=y
	add t1, a0, a1
	add t2, a0, a2
	lw t3, (t1)
	lw t4, (t2)
	sw t3, (t2)
	sw t4, (t1)
	ret

invert: # a0=v, a1=size
	addi sp, sp, -8
	sd ra, 0(sp)
	
	add s1, zero, zero # x
	add s2, a1, zero # y
	slli s2, s2, 2
	add s3, a0, zero # v
	
	invertloop:
		bge s1, s2, endinvert
		
		add a0, s3, zero
		add a1, s1, zero
		add a2, s2, zero
		jal swap
		addi s1, s1, 4
		addi s2, s2, -4
		j invertloop
	
	endinvert:
	ld ra, 0(sp)
	addi sp, sp, 8
	ret
		
		
	
