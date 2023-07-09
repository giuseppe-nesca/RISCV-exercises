.globl _start
.data
    num: .dword 2
.text
_start:
    # call fib
    la    a0, num
    ld    a0, 0(a0)
    jal   ra, fib
    
    li a7, 1
    ecall

    #exit
    li    a7, 10
    ecall

#****************************************************
# completare la funzione fib nel campo di sotto



fib: # a0: n
	li t1, 1
	beq a0, zero, fib_ret_0
	beq a0, t1, fib_ret_1
	
	addi sp, sp, -16
	sd ra, 0(sp)
	sd s1, 8(sp)
	mv s1, a0
	
	addi a0, a0, -1
	jal fib
	
	mv t0, s1
	mv s1, a0
	
	addi a0, t0, -2
	jal fib
	add a0, s1, a0
	
	ld s1, 8(sp)
	ld ra, 0(sp)
	addi sp, sp, 16
	ret
	
	fib_ret_0:
		add a0, zero, zero
		ret
	fib_ret_1:
		li a0, 1
		ret
	
	
	
	
	

