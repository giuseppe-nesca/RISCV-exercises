.globl _start
.data
    srcstr: .string  "string to be copied"
    dststr: .string  "destination string is long enough"
.text
_start:
    
    # chiama strcpy    
    la   a0, srcstr
    la   a1, dststr
    jal  ra, strcpy

    li a7, 4
    la a0, dststr
    ecall

    #exit
    li   a7, 10
    ecall

#*******************************************************************************
# strlen
# a0 - str
#*******************************************************************************
strlen:
        add  t0, zero, zero
strlen_loop:
        add  t1, t0, a0    
        lbu  t1, 0(t1)     
        beq  t1, zero, strlen_end
        addi t0, t0, 1 
        j    strlen_loop
strlen_end:
        addi a0, t0, 0
        ret    

#****************************************************
# completare la funzione strcpy nel campo di sotto


strcpy: # a0: *src, a1: *dst
	addi sp, sp, -32
	sd ra, 0(sp)
	sd s1, 8(sp)
	sd s2, 16(sp)
	sd s3, 24(sp)
	
	mv s1, a1 # dst
	mv s2, a0 # src
	
	jal strlen
	mv s3, a0 # m: len(src)
	
	mv a0, s1
	jal strlen
	mv t3, a0 # n: len(dst)
	
	add t0, zero, zero # i = 0
	
	strcpy_loop:
		bge t0, s3, strcpy_loop2
		add t2, s2, t0 # *src[i]
		add t1, s1, t0 # *dst[i]
		lbu t2, (t2) # src[i]
		sb t2, (t1)
		addi t0, t0, 1
		j strcpy_loop
		
	strcpy_loop2:
		bge t0, t3, strcpy_end
		add t1, s1, t0 # *dst[i]
		sb zero, (t1)
		addi t0, t0, 1
		j strcpy_loop2
	
	strcpy_end:
	
	ld s3, 24(sp)
	ld s2, 16(sp)
	ld s1, 8(sp)
	ld ra, 0(sp)
	addi sp, sp, 32
	ret
	
	
	
