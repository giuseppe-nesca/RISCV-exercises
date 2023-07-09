.globl _start
.data
    numstr: .string  "123"
.text
_start:
    # chiama strlen per ottenere la lunghezza della stringa
    la   a0, numstr
    jal  ra, strlen
    
    # chiama atoi
    mv   a1, a0
    la   a0, numstr
    jal  ra, atoi
    
    li a7, 1
    ecall
    
    #exit
    li   a7, 10
    ecall

#*******************************************************************************
# strlen
# a0 - str
#*******************************************************************************
strlen:
        add  t0, zero, zero
strlen_loop:
        add  t1, t0, a0    
        lbu  t1, 0(t1)     
        beq  t1, zero, strlen_end
        addi t0, t0, 1 
        j    strlen_loop
strlen_end:
        addi a0, t0, 0
        ret  
        


atoi: #a0: *str, a1: n
	beq a1, zero, atoi_ret0
	
	addi sp, sp, -16
	sd ra, 0(sp)
	sd s1, 8(sp)
	
	addi a1, a1, -1
	
	add s1, a0, a1
	lbu s1, (s1)
	addi s1, s1, -48
	
	jal atoi
	li t0, 10
	mul a0, a0, t0
	add a0, a0, s1
	
	ld s1, 8(sp)
	ld ra, 0(sp)
	addi sp, sp, 16
	ret
	
	atoi_ret0:
	add a0, zero, zero
	ret
	
	
	







