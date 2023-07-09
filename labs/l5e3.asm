.globl _start
.data
 MemVett: .dword -12, 2, 1, 3, 5, 1, 7, 1, -1, 4
 
 .text
 _start:
 	
addi t0, zero, 3
la t2, MemVett

addi t1, t1, 0
addi t3, zero, 10
CICLO:
ld t4, 0(t2)
add t0, t0, t4
addi t2, t2, 8
addi t1, t1, 1
blt t1, t3, CICLO

end:
addi x17, zero, 10
ecall