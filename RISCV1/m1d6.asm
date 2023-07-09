.globl _start
.data
      buffer: .string  "Pss4"
.text
_start:
    # call passrules
    la   a0, buffer
    jal  ra, passrules
    
    li a7, 1
    ecall

    #exit
    li   a7, 10
    ecall

contains: # a0: *str, a1: low, a2: high
	add t0, zero, zero
	
	contains_loop:
		add t1, a0, t0
		lbu t1, (t1)
		beq t1, zero, contains_end_false
		addi t0, t0, 1
		blt t1, a1, contains_loop
		bgt t1, a2, contains_loop
		li a0, 1
		ret
	
	contains_end_false:
	add a0, zero, zero
	ret    
    
    
passrules: # a0: *str
	addi sp, sp, -16
	sd ra, 0(sp)
	sd s1, 8(sp)
	
	mv s1, a0	
	li a1, 'A'
	li a2, 'Z'
	jal contains
	mv t0, a0
	mv a0, s1
	mv s1, t0
	li a1, '0'
	li a2, '9'
	jal contains
	
	and a0, s1, a0
	
	ld s1, 8(sp)
	ld ra, 0(sp)
	addi sp, sp, 16
	ret
	
	
	







	