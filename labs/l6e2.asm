.globl _start
.data

.text

_start:
li a0, 24
li a1, 30
	
jal mcm

li a7, 1
ecall


_end:
li a7, 10
ecall


MCD:
while:
beq a0, a1, end_while
	ble a0, a1 else
		sub a0, a0, a1
		j while
	else:
		sub a1, a1, a0
	j while
end_while:
ret

mcm:
addi sp, sp, -16
sd ra, 0(sp)
sd s1, 8(sp)
mul s1, a0, a1
jal MCD
div a0, s1, a0
ld s1, 8(sp)
ld ra, 0(sp)
addi sp, sp, 16
ret

