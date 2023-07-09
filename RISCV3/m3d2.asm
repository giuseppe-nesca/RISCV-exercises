.globl _start
.data
    str: .string "Hello World!"

.text
_start:
    # call hash
    la  a0, str
    jal ra, hash

    #exit
    li   a7, 10
    ecall

#******************************************
# completare la funzione nel campo di sotto


hash: # a0: *str
	li t0, 5381
	add t1, zero, zero
	
	hash_loop:
		add t2, a0, t1
		lbu t2, (t2) # t2 = str[i]
		beq t2, zero, hash_endloop
		
		slli t3, t0, 5 # t3 = hash << 5
		add t3, t0, t3 # t3 += hash
		add t0, t3, t2 # hash = t3 + str[i]
		addi t1, t1, 1
		j hash_loop
	
	hash_endloop:
	mv a0, t0
	ret