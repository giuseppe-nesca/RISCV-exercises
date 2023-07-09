.globl _start
.data
	src: .string "my long string\n"
 	dst: .string "--------------------------"
.text
_start:
	la a0, dst
	la a1, src
	jal strcpy
	
	la a0, src
	li a7, 4
	ecall
	
	la a0, dst
	ecall
		

_end:
	li a7, 10
	ecall
	

strlen:
 add t0, zero, zero # i = 0
 # Start of for loop
strlen_loop:
 add t1, t0, a0 # Add the byte offset for str[i]
 lbu t1, 0(t1) # Dereference str[i]
 beq t1, zero, strlen_end # if str[i] == 0, break for loop
 addi t0, t0, 1 # i++
 j strlen_loop # loop
strlen_end:
 addi a0, t0, 0 # Move t0 into a0 to return
 ret


strcpy:
	addi sp, sp, -24
	sd ra, 0(sp)
	sd a0, 8(sp)
	sd a1, 16(sp)
	
	jal strlen
	add, t2, a0, zero
	ld a0, 16(sp)
	jal strlen
	add, t1, a0, zero
	
	ld a2, 8(sp)
	ld a1, 16(sp)
	li t0, 0
	
	loop1:
		bge t0, t1, endloop1
		add t3, a1, t0
		lbu t4, 0(t3)
		add t3, a2, t0
		sd t4, 0(t3)
		addi t0, t0, 1
		j loop1
	endloop1:
	loop2:
		bge t0, t2, endloop2
		add t3, a2, t0
		sd zero, 0(t3)
		addi t0, t0, 1
		j loop2
	endloop2:
	ld ra, 0(sp)
	addi sp, sp, 24
	ret
		
		 
		
	
	
