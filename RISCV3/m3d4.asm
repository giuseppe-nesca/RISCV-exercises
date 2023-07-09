  .globl _start
  .data
    size:  .word  10
    array: .word  5,2,6,6,23,17,9,25,3,4
  
  .text
  _start:
      # chiama minarray
      la   a0, array
      la   a1, size
      lw   a1, 0(a1)
      jal  ra, minarray
      
      li a7 1
      ecall
      
      #exit
      li   a7, 10
      ecall   

#****************************************************
# completare la funzione minarray nel campo di sotto


minarray: # a0: *array, a1: size
	add t0, zero, zero # min_idx = 0
	lw t1, (a0) # min_val = array[0]
	li t2, 4 # i = 1
	slli t3, a1, 2 # size * 4
	
	minarray_loop:
		bge t2, t3, minarray_endloop
		add t4, a0, t2
		lw t4, (t4)
		bge t4, t1, minarray_continue
			mv t0, t2
			mv t1, t4
		minarray_continue:
		addi t2, t2, 4
		j minarray_loop
	
	minarray_endloop:
	srli a0, t0, 2
	ret