.globl _start
.data
    array: .word  1,2,3,4,5,6,7,8,9,10
    size:  .word  10
    
.text
_start:
    # chiama sumarray
    la   a0, array
    la   a1, size
    lw   a1, 0(a1)
    jal  ra, sumarray
    
    li a7, 1
    ecall
    
    #exit
    li   a7, 10
    ecall

#****************************************************
# completare la funzione sumarray nel campo di sotto

sumarray: # a0: *array, a1: size
	add t0, zero, zero # i = 0
	mv t1, a0 # t1: *array
	add a0, zero, zero # a0: sum
	slli a1, a1, 2
	sumarray_loop:
		bge t0, a1, sumarray_end
		add t2, t1, t0
		lw t2, (t2)
		add a0, a0, t2
		addi t0, t0, 4
		j sumarray_loop
	sumarray_end:
	ret

sumarrayr: #a0: *array, a1: size
	
	beq a1, zero, sumarrayr_ret_0
	
	addi sp, sp, -16
	sd ra, 0(sp)
	sd s1, 8(sp)
	
	addi a1, a1, -1
	slli t0, a1, 2
	add t0, a0, t0
	lw s1, (t0)
	
	jal sumarrayr
	add a0, a0, s1
	
	ld s1, 8(sp)
	ld ra, 0(sp)
	addi sp, sp, 16
	ret	
	
	sumarrayr_ret_0:
	add a0, zero, zero
	ret
	
