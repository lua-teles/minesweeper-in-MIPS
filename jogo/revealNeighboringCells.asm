.include "macros.asm"

.globl revealNeighboringCells

revealNeighboringCells:
save_context
 move $s1, $a0	#move a linha para $s1
 move $s0,$a2	#tabuleiro
  move $s4, $a1	#move o valor da coluna para $s4

 
 addi $s2, $s1,-1	#i=row-1
 addi $s3, $s1,1		#row+1

 come_for_i:
 bgt $s2,$s3,end_i
 addi $s5,$s4,-1		#j
 addi $s6, $s4,1		#COLUM+1
 
 come_for_j:
  bgt $s5, $s6,end_j
  blt $s2, $zero, contin
  bge $s2, SIZE , contin	
  blt $s5, $zero, contin
  bge $s5, SIZE , contin
	
	sll $t0, $s2, 5
	sll $t1, $s5, 2
	add $t0,$t1,$t0
	add $t0, $s0, $t0
	move $s7, $t0
	lw $t1,0($t0)
	
  bne $t1,-2, contin


  move $a0, $s2
  move $a1, $s5
  move $a2,$s0

 jal countAdjacentBombs
	sw $v0,0 ($s7)

  bne $v0, 0, contin
  
  move $a0, $s2
  move $a1, $s5
  move $a2,$s0
  
 jal revealNeighboringCells

 contin:
	addi $s5,$s5,1
	j come_for_j
	
 end_j:
	addi $s2,$s2,1
	j come_for_i
	
 end_i:
	restore_context
	jr $ra

