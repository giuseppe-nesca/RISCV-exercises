.globl _start
.text
_start:
	li t0, 37 # numero da controllare
	li t1, 64 # n bit
	li t3, 0 # counter
	li t4, 1 # mask
	
while: 
	beq t1, zero, end_while
		and t5, t0, t4
		add t3, t3, t5
		srli t0, t0, 1
		addi t1, t1, -1
		j while
	
end_while:
	
	


end:
	addi x17, zero, 10
	ecall