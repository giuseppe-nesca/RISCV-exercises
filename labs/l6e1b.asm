.globl _start
.data

.text

_start:
li a0, 24,
li a1, 30
	
jal gcd_v2

li a7, 1
ecall


_end:
li a7, 10
ecall

gcd_v2:
add a2, zero, a0
gcd_v2_while:
ble a0, zero, gcd_v2_end_while
	gcd_v2_if:
	rem t0, a2, a0
	bne t0, zero, gcd_v2_endif
		rem t1, a1, a0
		beq t1, zero, gcd_v2_end_while
	
	gcd_v2_endif:
	addi a0, a0, -1
	j gcd_v2_while
	
gcd_v2_end_while:
ret
		
	
	
	
	