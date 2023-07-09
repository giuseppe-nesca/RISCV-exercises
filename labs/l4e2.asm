.globl _start
.text

_start: 
	li t0, 10
	li t1, 11
	li t2, 6
	
	bge t0 , t1, t0maggioreuguale # compare t0 e t1
		add t3, t1, zero
		j compareT2
t0maggioreuguale: 
	add t3, t0, zero

compareT2: 
	bge t3, t2, end
		add t3, t2, zero
		
end:
	addi a0, t3, 0
	li a7,1
	ecall
	

		
			
			
endif: