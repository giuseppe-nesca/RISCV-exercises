.globl _start
.data
	str1: .string "first"
	str2: .string "second"
.text
_start:
	la a0, str1
	la a1, str2
	jal strcmp
	
	li a7, 1
	ecall


_end:
	li a7, 10
	ecall
	
strcmp:
	loop:
		lbu t0, 0(a0)
		lbu t1, 0(a1)
		beq t0, zero, endloop
			beq t1, zero, str_cmp_end
				bne t0, t1, not_equals
				addi a0, a0, 1
				addi a1, a1, 1
				j loop
	endloop:
	beq t1,	zero, equals
	not_equals:
	li a0, 1
	j str_cmp_end
	equals:
	li a0, 0
			
	str_cmp_end:
	ret