.globl _start
.data
    needle: .word 2
    size:   .word 8
    array:  .word 1,2,3,7,9,10,11,15
.text
_start:
    # chiama binsearch
    la   a0, array
    la   a1, size
    lw   a1, 0(a1)
    la   a2, needle
    lw   a2, 0(a2)
    jal  ra, binsearch
    
    li a7, 1
    ecall
    
    #exit
    li   a7, 10
    ecall

#***************************************************
# completare la funzione binsearch nel campo di sotto
 
binsearch: # a0: *array, a1: size, a2: needle
	add t0, zero, zero # low = 0
	addi t6, a1, -1 # high = size - 1
	
	binsearch_loop:
		bgt t0, t6, binsearch_not_found
		
		add t2, t0, t6 # t2 = low + high
		srli t2, t2, 1  # / 2
		
		slli t3, t2, 2
		add t3, t3, a0
		lw t3, (t3)
		
		beq t3, a2, binsearch_ret_mid
		blt t3, a2, binsearch_midp1
		addi t6, t2, -1
		j binsearch_loop
		binsearch_midp1:
		addi t0, t2, 1
		j binsearch_loop	
	
	binsearch_not_found:
	li a0, -1
	ret
	
	binsearch_ret_mid:
	mv a0, t2
	ret
		
		
		
		
		





