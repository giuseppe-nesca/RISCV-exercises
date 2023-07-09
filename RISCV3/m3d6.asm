.globl _start
.data
  size:  .word  10
  array: .word  1,3,5,6,7,8,9,25,30,40

.text
_start:
    # chiama issorted
    la   a0, array
    la   a1, size
    lw   a1, 0(a1)
    jal  ra, issorted
    
    #exit
    li   a7, 10
    ecall   

#****************************************************
# completare la funzione issorted nel campo di sotto


issorted:
	add t0, zero, zero
	addi t6, a1, -1
	slli t6, t6, 2
	
	issorted_loop:
		bge t0, t6, issorted_ret1
		add t1, a0, t0
		lw t1, (t1)
		addi t2, t0, 4
		add t2, a0, t2
		lw t2, (t2)
		addi t0, t0, 4
		ble t1, t2, issorted_loop
			add a0, zero, zero
			ret
		
	issorted_ret1:
	li a0, 1
	ret