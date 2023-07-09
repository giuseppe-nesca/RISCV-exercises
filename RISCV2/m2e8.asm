    .globl _start
    .data
        size:  .word 8
        array: .word 1,5,3,7,2,6,4,8
    .text
    _start:
        # chiama invert
        la   a0, array
        la   a1, size
        lw   a1, 0(a1)        
        jal  ra, invert
        
        #exit
        li   a7, 10
        ecall
    
    #***************************************************
    # completare la funzione invert nel campo di sotto
    
    
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
	
	
invert: # a0: *array, a1: size
	addi sp, sp, -32
	sd ra, 0(sp)
	sd s1, 8(sp)
	sd s2, 16(sp)
	sd s3, 24(sp)
	
	mv s3, a0
	add s1, zero, zero
	addi s2, a1, -1
	
	invert_loop:
		bge s1, s2, invert_endloop
		mv a0, s3
		mv a1, s1
		mv a2, s2
		jal swap
		addi s1, s1, 1
		addi s2, s2, -1
		j invert_loop
	invert_endloop:
	
	ld s3, 24(sp)
	ld s2, 16(sp)
	ld s1, 8(sp)
	ld ra, 0(sp)
	addi sp, sp, 32
	ret
		
	
	