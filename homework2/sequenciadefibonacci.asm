; Sequência de Fibonacci: 0, 1, 1, 2, 3, 5, 8, 13 (D em hexadecimal), ...

.org 2000h

LXI H, 2000H ; Onde os números começaram a ser armazenados OBS: ARRUMAR ISSO depois
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
INX H ; 2001H... 2002H ... 2003H... 2004H
DCR D 
JNZ loop
HLT ; Finaliza o programa
