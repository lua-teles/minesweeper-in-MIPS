.include "macros.asm"

.globl checkVictory

checkVictory:
# your code here
save_context
 move $s0,$a0
 li $s4,0
 li $s1,0  #i=0;

for_i:
 li $t0, SIZE
 bge $s1, $t0,fim_i	#enquanto

 li $s2, 0 #j=0;
for_j:
 li $t0, SIZE
 bge $s2,$t0, fim_j

	sll $t0, $s1, 5
	sll $t1, $s2, 2		
	add $t0,$t1,$t0		
	add $t0, $s0, $t0 	
	lw $t1,0($t0)
	move $s3,$t1
	
 blt $s3, $zero,end_if
 addi $s4,$s4,1
 
end_if:
 addi $s2, $s2,1
 j for_j
 
fim_j:
 addi $s1,$s1,1
 j for_i
 
fim_i:
 li $t2, 0
 li $t3, SIZE
 mul $t3,$t3,$t3
 move $t2,$t3
 subi $t4,$t2,BOMB_COUNT

 bge $s4,$t4,f_total
 li $v0,0
restore_context
 jr $ra
f_total:
 li $v0, 1
restore_context
 jr $ra
