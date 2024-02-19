.include "macros.asm"

.globl countAdjacentBombs

countAdjacentBombs:
# your code here
save_context
 move $s0,$a2
 addi $s1,$a0,-1
 addi $s2,$a0,1
 
 li $s5,0
for_de_i:
 bgt $s1,$s2,fim_de_i

 addi $s3,$a1,-1
 addi $s4,$a1,1

for_de_j:

 bgt $s3, $s4,fim_de_j

 blt $s1, $zero, continuar
 bge $s1, SIZE , continuar		
 blt $s3, $zero, continuar
 bge $s3, SIZE , continuar
	
 	sll $t0, $s1, 5
	sll $t1, $s3, 2
	add $t0,$t1,$t0
	add $t0, $s0, $t0
	lw $t1,0($t0)
	
	bne $t1,-1, continuar
	
	addi  $s5,$s5,1
	
 continuar:
	addi $s3,$s3,1
	j for_de_j

fim_de_j:
 addi $s1,$s1,1
 j for_de_i
 
fim_de_i:
 move $v0,$s5
 
 restore_context
 jr $ra
