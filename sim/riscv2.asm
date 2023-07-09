.globl _start
.data
    array: .word 4, 2, 2, 4, 4, 5, 4, 3, 3, 3
    len:   .word 10
.text
_start:
    # chiama occurs_ab
    la   a0, array
    la   t0, len
    lw   a1, 0(t0)
    li   a2, 3
    li   a3, 4
    jal  ra, occurs_ab
    #exit
    li   a7, 10
    ecall
#*************************************************
# incollare in questo punto la soluzione del primo esercizio
#*************************************************
# completare la funzione occurs_ab nel campo di sotto

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

occurs_ab:
	addi sp, sp, -32
	sd ra, 0(sp)
	sd s1, 8(sp)
	sd s2, 16(sp)
	sd s3, 24(sp)
	
	mv s1, a0
	mv s2, a1
	mv s3, a3
	
	jal occurs
	mv t0, a0
	
	mv a0, s1
	mv a1, s2
	mv a2, s3
	
	mv s1, t0
	
	jal occurs
	
	add a0, a0, s1
	
	ld s3, 24(sp)
	ld s2, 16(sp)
	ld s1, 8(sp)
	ld ra, 0(sp)
	addi sp, sp, 32
	ret
	
	


	