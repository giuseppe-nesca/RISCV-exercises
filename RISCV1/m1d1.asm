.globl _start
.data
    num1: .dword 24
    num2: .dword 30
.text
_start:
    # call MCD
    la    a0, num1
    la    a1, num2
    ld    a0, 0(a0)
    ld    a1, 0(a1)     
    jal   ra, mcd
    
    li a7, 1
    ecall

    #exit
    li    a7, 10
    ecall
	

mcd: # a0: a, a1: b

	mcd_loop:
		beq a0, a1, mcd_endloop
		ble a0, a1, mcd_else
			sub a0, a0, a1
			j mcd_loop
		mcd_else:
			sub a1, a1, a0
			j mcd_loop
	
	mcd_endloop:
	ret