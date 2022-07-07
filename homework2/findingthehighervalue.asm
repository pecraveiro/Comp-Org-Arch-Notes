; O programa encontra o maior valor armazenado nos endereços

.org 2000h

LXI H, 4000H ; input the first number in the array
MOV C, M ; movendo para o registrador C
INX H ; input the first data
DCR C ; vamos colocar um novo dado
MOV A, M ; colocamos o primeiro dado no acumulador
skip: INX H ; input the second data
CMP M ; comparar o acumulador com a memória
JNC loop ; se um carry for gerado, significa que o acumulador contém o maior número
MOV A, M ; movemos o conteúdo da memória para o acumulador
loop: DCR C
JNZ skip
STA 400AH ; stores the higher valor, armazena o maior valor
HLT ; Finaliza o programa
