.globl _start
.data
    array: .word 4, 2, 2, 4, 4, 5, 4, 3, 3, 3
    len:   .word 10
.text
_start:
    # chiama occurs
    la   a0, array
    la   t0, len
    lw   a1, 0(t0)
    li   a2, 4
    jal  ra, occurs
    # exit
    li   a7, 10
    ecall
#*************************************************
# completare la funzione occurs nel campo di sotto

occurs: # a0: *array, a1: len, a2: num
	
	add t0, zero, zero # i
	add t1, zero, zero # sum
	slli t2, a1, 2 # len * 4
	
	occurs_loop:
		bge t0, t2, occurs_end
		
		add t3, a0, t0
		lw t3, (t3)
		
		bne t3, a2, occurs_next
			addi t1, t1, 1
		occurs_next:
		addi t0, t0, 4
		j occurs_loop
	
	occurs_end:
	mv a0, t1
	ret
		