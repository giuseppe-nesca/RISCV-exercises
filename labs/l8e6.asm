.globl _start
.data
	v: .word 55 111 22 4 3
.text
_start:
	la a0, v
	li a1, 5
	jal minarray
	
	li a7 1
	ecall
	
_end:
	li a7, 10
	ecall
	
minarray: # a0: v, a1: size
	li t3, -1 # ritorna -1 in caso di size == 0
	li t0, 0 # curr offset
	slli a1, a1, 2 # max offse 
	
	minarray_loop:
		beq t0, a1, minarray_end
		add t4, a0, t0
		lw t1, (t4)
		beq t0, zero, minarray_first_element
		bge t1, t2, minarray_continue
		
		minarray_first_element:
		mv t3, t0 #aggiorna min index
		mv t2, t1 #aggiorna min value
		minarray_continue:
		addi t0, t0, 4
		j minarray_loop
	
	minarray_end:
	srli t3, t3, 2
	mv a0, t3
	ret
		
		
