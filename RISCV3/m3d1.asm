.globl _start
.data
    str: .string "Hello World!"
    n:   .word   6

.text
_start:
    # call charAt
    la  a0, str
    la  a1, n
    lw  a1, 0(a1)
    jal ra, charAt
    
    li a7, 11
    ecall

    #exit
    li   a7, 10
    ecall

#******************************************
# completare la funzione nel campo di sotto

charAt: # a0: *str, a1: n

	add t0, a0, a1
	lbu a0, (t0)
	ret






