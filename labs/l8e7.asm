.globl _start
.data
	v: .word 3 3 2 4 5
.text
_start:


_end:
	li a7, 10
	ecall
	

selection_sort: # a0: v, a1: size
	addi sp, sp, -32
	sd ra, 0(sp)
	sd s1, 8(sp) # i
	sd s2, 16(sp) # size
	sd s3, 24(sp) #  v
	
	li s1, 0 # i = 0
	addi s2, a1, -1 # size -1
	
	selection_sort_loop:
		
			
			 
			   
			
	
	

	ld s3, 24(sp)
	ld s2, 16(sp)
	ld s1, 8(sp)
	ld ra, 0(sp)
	addi sp, sp, 32
	ret