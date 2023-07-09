.globl _start
.data
    d: .byte '1'
.text
_start:
    # call digit
    la   a0, d
    lbu  a0, 0(a0)
    jal  ra, digit

    #exit
    li   a7, 10
    ecall

#****************************************************
# completare la funzione digit nel campo di sotto


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
	