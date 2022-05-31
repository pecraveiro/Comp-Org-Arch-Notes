; O Programa realiza a multiplicação de dois números e armazena em um determinado local na memória. 
; Não temos uma instrução/função para fazer a multiplicação
; Vamos utilizar a soma para fazer a multiplicação
; Por exemplo, para fazermos a multiplicação de 04H x 03H = 12H = 0CH
; Precisamos somar: 04 + 04 + 04 = 12H

; Inicia o programa
.org 2000H ; Inicia em 2000

LXI H, 2050H  ; Primeiro input e armazenando no endereço de memória 2050H
MOV B, M ; B será o "fator ou multiplicando"
MVI A, 00H ; por segurança iniciamos com 0
MVI D, 00H ; this registrator will register all the carries 
INX H
MOV C, M ; C será o "fator ou multiplicador"
loop2:ADD B
JNC loop
INR D
loop: DCR C
JNZ loop2
STA 2052H
MOV A,D
STA 2053H ; Store the carry
HLT
