# Minesweeper-in-MIPS
## Trabalho Minesweeper em MIPS
 Esse trabalho foi realizado pela dupla Luana Teles e Stefani Rodrigues. Neste arquivo iremos explicar as configurações, a execusão e outras coisas do projeto.
 
## Sumario
- [Play](#Play)
- [countAdjacentBombs](#countAdjacentBombs)
- [revealAdjacentCells](#revealAdjacentCells)
- [checkVictory](#checkVictory)

### Play
A funçao Play é responsavel pela execução das jogadas efetuadas pelo jogador. Ela analiza a coodenada dada pelo jogador, por meio do numero da linha [row] e da coluna [column] fornecida pelo mesmo, e verifica se uma bomba foi atingida. Se esse for o caso, a função encerra o jogo e o jogador perde. Se nenhuma bomba foi atingida, então o jogo continua sendo executado.

