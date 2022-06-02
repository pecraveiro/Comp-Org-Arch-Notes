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
INX H ; Incremento de um o conteúdo do par de registradores
MOV C, M ; C será o "fator ou multiplicador"
loop2:ADD B ; Adiciona conteúdo do registro ao acumulador
JNC loop ; Salta para endereço se o flag carry não estiver setado
INR D ; Incrementa de um o conteúdo do registrador
loop: DCR C ; Decrementa de um conteúdo do registrador
JNZ loop2 ; Salta para endereço se o flag zero não estiver setado
STA 2052H ; Armazena em endereço o conteúdo do acumulador
MOV A,D ; Move conteúdo de D para A
STA 2053H ; Store the carry
HLT ; Para o microprocessador
