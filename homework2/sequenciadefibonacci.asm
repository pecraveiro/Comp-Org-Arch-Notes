; Sequência de Fibonacci: 0, 1, 1, 2, 3, 5, 8, 13 (D em hexadecimal), ...

.org 2000h

LXI H, C050H ; Onde os números começaram a ser armazenados
LDA D000H 
MOV D, A 
MVI B, 00H
MVI C, 01H
MVI A, 00H
loop: MOV M, A 
ADD C ; (A <- A+C)
MOV B, C
MOV C, A
MOV B, A
INX H ; C051H... C052H
DCR D 
JNZ loop
HLT