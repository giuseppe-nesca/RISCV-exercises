.globl _start
.data
    num: .dword 10        
.text
_start:
    # call serief
    la    a0, num
    jal   ra, serief

    #exit
    li    a7, 10
    ecall

#****************************************************
# completare la funzione serief nel campo di sotto

serief: #a0: num
	li t0, 1 # 1
	beq a0, t0, serief_ret1
	addi t0, t0, 1 # 2
	beq a0, t0, serief_ret1
	addi t0, t0, 1 # 3
	beq a0, t0, serief_ret1
	
	addi sp, sp, -24
	sd ra, 0(sp)
	sd s1, 8(sp)
	sd s2, 16(sp)

	mv s1, a0
	
	addi a0, s1, -1
	jal serief
	mv s2, a0
	
	addi a0, s1, -2
	jal serief
	add s2, s2, a0
	
	addi a0, s1, -3
	jal serief
	add a0, s2, a0
	
	ld s2, 16(sp)
	ld s1, 8(sp)
	ld ra, 0(sp)
	addi sp, sp, 24
	ret
	
	serief_ret1:
	li a0, 1
	ret
	
	
	