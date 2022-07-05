; Sequência de Fibonacci: 0, 1, 1, 2, 3, 5, 8, 13 (D em hexadecimal), ...

.org 1500h

MVI C, 09H
LXI H, 2000H ; Onde os números começam a ser armazenados
MVI A, 00H
MOV M, A
INR A
INX H
loop: MOV M,A
DCX H
ADD M
INX H
INX H
DCR C
JNZ loop
HLT ; Finaliza o programa
