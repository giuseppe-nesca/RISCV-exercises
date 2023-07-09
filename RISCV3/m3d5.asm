 .globl _start
  .data
    size:  .word  10
    array: .word  3,1,6,6,23,17,9,25,3,4
  
  .text
  _start:
      # chiama selection_sort
      la   a0, array
      la   a1, size
      lw   a1, 0(a1)
      jal  ra, selection_sort
      
      #exit
      li   a7, 10
      ecall   

#****************************************************
# completare la funzione selection_sort nel campo di sotto

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
	
swap: # a0: *array, a1: x, a2: y
	slli a1, a1, 2
	slli a2, a2, 2
	
	add a1, a0, a1
	add a2, a0, a2
	
	lw t1, (a1)
	lw t2, (a2)
	sw t1, (a2)
	sw t2, (a1)
	
	ret
	

selection_sort: #a0: *array, a1: size
	li t1, 1
	ble a1, t1, selection_sort_ret

	addi sp, sp, -24
	sd ra, 0(sp)
	sd s1, 8(sp)
	sd s2, 16(sp)

	
	mv s1, a0
	mv s2, a1
	
	jal minarray

	mv a2, a0
	mv a0, s1
	mv a1, zero
	jal swap
	
	addi a0, s1, 4
	addi a1, s2, -1
	jal selection_sort

	
	ld s2, 16(sp)
	ld s1, 8(sp)
	ld ra, 0(sp)
	addi sp, sp, 24
	selection_sort_ret:
	ret





	