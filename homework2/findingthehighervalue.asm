; O programa encontra o maior valor armazenado nos endereços

.org 2000h

LXI H, 4000H
MOV C, M
INX H
DCR C
MOV A, M
skip: INX H
CMP M
JNC loop
MOV A, M
loop: DCR C
JNZ skip
STA 400AH ; stores the higher valor, armazena o maior valor
HLT ; Finaliza o programa
