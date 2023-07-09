.globl _start
.data
    num: .dword 8     
.text
_start:
    # call serief
    la    a0, num
    jal   ra, serief
    
    li a7, 1
    ecall

    #exit
    li    a7, 10
    ecall

#****************************************************
# completare la funzione serief nel campo di sotto



serief: # a0: *n 
	ld t1, (a0)
	li t0, 3
	bgt t1, t0, serief_m3
	li a0, 1
	ret
	
	serief_m3:
	addi sp, sp, -32
	sd ra, 0(sp)
	sd s1, 8(sp)
	sd s2, 16(sp)
	sd s3, 24(sp)
	
	mv s1, a0
	mv s3, t1

	addi t1, s3, -1	
	sd t1, 0(s1)
	jal serief
	mv s2, a0
	
	addi t1, s3, -2	
	sd t1, 0(s1)
	mv a0, s1
	jal serief
	add s2, s2, a0
	
	addi t1, s3, -3	
	sd t1, 0(s1)
	mv a0, s1
	jal serief
	add a0, s2, a0
	
	ld s3, 24(sp)
	ld s2, 16(sp)
	ld s1, 8(sp)
	ld ra, 0(sp)
	addi sp, sp, 32
	ret
	
	
	
	