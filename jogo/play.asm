.include "macros.asm"

.globl play

play:
# your code here
save_context 
 move $s1,$a0	#coloca a linha escolhida em $s1; $s s�o valores temporarios salvos,valores que sao preservados entre chamadas
 move $s2, $a1	#coloca a coluna escolhida em $s2;
 move $s0,$a2	#em $a2 est� o endere�o de iniciar o tabuleiro
 
	sll $t0, $s1, 5		# multiplica $s1 por 2^5/4 ou seja 2� ou 8 e o resultado fica em $t0
	sll $t1, $s2, 2		# s� coloca o valor de $s2 em $t1 seguindo o modelo de cima
	add $t0,$t1,$t0		#soma t0 com t1 e salva o valor em t0 
	add $t0, $s0, $t0 	#aplica a coordenada no tabuleiro; $t s�o valores que n�o s�o salvos entre chamadas
	move $s3,$t0		#move o  valor de t0 pra s3
	lw $t1,0($t0)		#salva o valor de t0 em t1
	
 beq $t1,-1, return0	#quando t1 for -1 o jogo acaba pois o jogador atingiu uma bomba 
		#se t1 nao for -1 o jogo continua
 bne $t1,-2,return1 #bne significa parar se nao for igual
 
	move $a0, $s1		#move a linha escohida para $a0
	move $a1, $s2		#move a coluna escolhida para $a1
	move $a2,$s0		#tabuleiro
	
 jal countAdjacentBombs	#chama a fun��o de contar bombas adjacentes
	
 sw $v0,0 ($s3)

 bne $v0, 0, return1

	move $a0, $s1
	move $a1, $s2
	move $a2, $s0
	
 jal revealNeighboringCells

  return1:
	li $v0,1
	restore_context
	jr $ra
	
 return0:
	li $v0,0
	restore_context
	jr $ra	#pula de volta para o main; $ra � o endere�o de retorno de um procedimento

