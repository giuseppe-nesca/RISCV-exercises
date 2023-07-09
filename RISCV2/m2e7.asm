.globl _start
.data
    size:  .word 8
    array: .word 1,5,3,7,2,6,4,8
    x:     .word 0
    y:     .word 1
    
.text
_start:
    # chiama swap
    la   a0, array
    la   a1, x
    lw   a1, 0(a1)
    la   a2, y
    lw   a2, 0(a2)
    jal  ra, swap
    
    la t0, array
    li t1, 0
    la t2, size
    lw t2, (t2)
    slli t2, t2, 2
    loop:
   	bge t1, t2, endloop
   	add a0, t0, t1
   	lw a0, (a0)
   
   	li a7, 1
    	ecall
    	li a7, 11
    	li a0, ' '
    	ecall
    	
    	addi t1, t1, 4
    	j loop
    endloop:
    
    #exit
    li   a7, 10
    ecall

#***************************************************
# completare la funzione swap nel campo di sotto


swap: # a0: *array, a1: x, a2: y
	slli a1, a1, 2
	slli a2, a2, 2
	
	add a1, a0, a1
	add a2, a0, a2
	
	lw t1, (a1)
	lw t2, (a2)
	sw t1, (a2)
	sw t2, (a1)
	
	ret