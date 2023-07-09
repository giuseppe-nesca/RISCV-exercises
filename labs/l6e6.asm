.globl _start
.data
 str: .string "my long string"
 char: .string "g"
.text
_start:
 la a0, str
 la t1, char
 lbu a1, 0(t1)
 jal ra, strrchr
 
 li a7, 1
 ecall
 
 li a7, 10
 ecall
 
 
 strrchr:
 	li t2, 0
 	loop:
 	lbu t1, 0(a0)
 	beq t1, zero, endloop
 	beq t1, a1, skip
 	add t2, zero, a0
 	skip:
 	addi a0, a0, 1
 	j loop
 endloop:
 	add a0, zero, t2
 	ret