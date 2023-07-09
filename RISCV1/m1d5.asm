.globl _start
#.section .data
.data
    buffer: .string  "test string"
    low:    .byte  'a'
    high:   .byte  'z'

.text
_start:
    # call contains
    la   a0, buffer
    la   a1, low
    la   a2, high
    lbu  a1, 0(a1)
    lbu  a2, 0(a2)
    jal  ra, contains
    
    li a7, 1
    ecall

    # exit
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
	
		
		
		
		