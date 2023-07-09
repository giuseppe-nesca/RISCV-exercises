.globl _start

.text

_start:
	
	li x5, 0
	li x6, 0xffffffffffffffff
	li t3, 0x3F
	slli t3, t3, 11
	and t5, x5, t3 #x5 contiene la selezione dei bit da sostituire
	slli t3, t3, 15 #mask2
	xori t4, t3, -1 #mask2 negata
	and x6, x6, t4 #azzero i bit da sostituire
	or x6, x6, t5 # sostituisco
	
	
	
	
	
	
	


exit:
	addi x17, x0, 10
	ecall
