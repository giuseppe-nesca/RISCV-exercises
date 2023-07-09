.globl _start
.data
    str1: .string  "first."
    str2: .string  "first."
.text
_start:
    # call strcmp
    la   a0, str1
    la   a1, str2
    jal  ra, strcmp
    
    li a7, 1
    ecall

    #exit
    li   a7, 10
    ecall
    
    
strcmp: # a0: *str1, a1: *str2
	add t0, zero, zero # i = 0
	strcmp_loop:
		add t1, a0, t0
		lbu t1, (t1)
		add t2, a1, t0
		lbu t2, (t2)
		beq t1, zero, strcmp_end
		beq t2, zero, strcmp_end_false
		
		bne t1, t2, strcmp_end_false
		addi t0, t0, 1
		j strcmp_loop
		
	strcmp_end_false:
	li a0, 1
	ret
	
	strcmp_end:
	bne t1, t2, strcmp_end_false
	add a0, zero, zero
	ret
		
		
		
		
		