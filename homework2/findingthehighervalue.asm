; O programa encontra o maior valor armazenado nos endereços

.org 2000h

LXI H, C050H
MOV C, M
INX H
DCR C
MOV A, M
skip INX H
CMP M
JNC loop
MOV A, M
loop DCR C
JNZ skip
STA C100H ; stores the higher valor, lembrar de trocar o valor
HLT
