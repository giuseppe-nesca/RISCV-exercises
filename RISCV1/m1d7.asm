.globl _start
.data
    str:  .string "my long string"
    c:    .byte 'g'
.text
_start:
    # call strchridx
    la   a0, str
    la   a1, c
    lb   a1, 0(a1)
    jal  ra, strchridx
    
    li a7, 1
    ecall

    #exit
    li   a7, 10
    ecall

    
            
strchridx: # a0: *str, a1: c
	add t0, zero, zero
	loop:
		add t1, a0, t0
		lbu t1, (t1)
		beq t1, zero, endloop
		beq t1, a1, endloop
		addi t0, t0, 1
		j loop
	endloop:
	bne t1, zero, else
		li a0, -1
		ret
	else:
		mv a0, t0
		ret
	
	
	
	
		
