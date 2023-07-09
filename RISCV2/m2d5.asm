.globl _start
.data
    numstr: .string  "1234"
.text
_start:
    # call isnumber
    la   a0, numstr
    jal  ra, isnumber

    #exit
    li   a7, 10
    ecall

#****************************************************
# completare la funzione isnumber nel campo di sotto

digit: # a0: n
	li t0, '0'
	li t1, '9'
	
	blt a0, t0, digit_f
	bgt a0, t1, digit_f
	li a0, 1
	ret
	
	digit_f:
	add a0, zero, zero
	ret
	
	
isnumber: # a0: *numstr
	addi sp, sp, -24
	sd ra, 0(sp)
	sd s1, 8(sp)
	sd s2, 16(sp)
	
	add s1, zero, zero
	mv s2, a0
	
	isnumber_loop:
		add a0, s2, s1
		lbu a0, (a0)
		beq a0, zero, isnumber_t
		jal digit

		beq a0, zero isnumber_f
		addi s1, s1, 1
		j isnumber_loop
	isnumber_t:
	li a0, 1
	isnumber_f:
	ld s2, 16(sp)
	ld s1, 8(sp)
	ld ra, 0(sp)
	addi sp, sp, 24
	ret
	












	