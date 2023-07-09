.globl _start
.text
_start:
	li t0, 1 # a
	li t1, 2 # b
	li t2, 0 # R
	li t3, 0 # i
	
for1:
	bge t3, t0, end_for1
		li t4, 0 # j
	for2:
		bge t4, t1, end_for2
			add t2, t2, t2
			add t2, t2, t3
			add t2, t2, t4
			
			addi t4, t4, 1
			j for2 
	end_for2:
		addi t3, t3, 1
		j for1
end_for1:



end:
	addi x17, zero, 10
	ecall
