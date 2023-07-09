.globl _start
.data
    str: .string  "My string"
.text
_start:
    # call strlen
    la   a0, str
    jal  ra, strlen
    
    li a7, 1
    ecall

    #exit
    li   a7, 10
    ecall
    
strlen: # a0: *str
	add t0, zero, zero # i = 0
	strlen_loop:
		add t2, a0, t0
		lbu t1, (t2)
		beq t1, zero, strlen_end
		addi t0, t0, 1
		j strlen_loop
	strlen_end:
	mv a0, t0
	ret		
		
	