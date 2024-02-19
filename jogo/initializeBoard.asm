.include "macros.asm"
.globl inicialializeBoard

inicialializeBoard:
	save_context
	move $s0, $a0 
  
  li $s1,0 # i = 0
  begin_for_i_it:						# for (int i = 0; i < SIZE; ++i) {
  li $t0,SIZE
  bge $s1,$t0,end_for_i_it 		#se s1 (i) for maior ou igual a t0(size); 
  
  li $s2,0 # j = 0
  begin_for_j_it:						# for (int j = 0; j < SIZE; ++j) {
  li $t0,SIZE
  bge $s2,$t0,end_for_j_it
  sll $t0, $s1, 5 # i*8  multiplica 2 por 2, 5 vezes 
  sll $t1, $s2, 2 # j
  add $t0, $t0, $t1	#somando as coordenadas registradas
  add $t0, $t0, $s0	#colocando as coordenadas no campo
  li $t1, -2
  sw $t1,0($t0)		#ta salvando t1 em t0(ta salvando em todo o tabuleiro dizendo que nao tem bomba);	# board[i][j] = -2; // -2 means no bomb
  addi $s2,$s2,1
  j begin_for_j_it
  end_for_j_it:
  addi $s1, $s1, 1
  j begin_for_i_it
  end_for_i_it:
  restore_context	#pegando o endereço antigo;
  jr $ra 	#volta pro main onde parou;
