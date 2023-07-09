.globl _start
.data
	v: .word 1 3 4 5 66 77
.text
_start:
	la a0, v
	li a1, 5
	
	jal issorted
	
	li a7, 1
	ecall

_end: 
	li a7, 10
	ecall 
	
	
issorted: # a0: v, a1: N
	li t1, 0
	slli a1, a1, 2
	issorted_loop:
		beq t1, a1, issorted_end_t
		add t3, a0, t1
		lw t0, (t3)
		beq t1, zero, issorted_next
		ble t0, t2,  issorted_end_f
		
		issorted_next:
		mv t2, t0
		addi t1, t1, 4
		j issorted_loop
	
	issorted_end_t:
		li a0, 1
		ret
	issorted_end_f:
		li a0, 0
		ret

		
	