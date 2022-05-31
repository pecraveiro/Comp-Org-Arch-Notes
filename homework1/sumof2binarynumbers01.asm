; O Programa realiza a soma de dois números e armazena em um determinado local na memória. Porém, tudo isso é feito pelo usuário manualmente

.org 2000H ; Inicia em 2000

MVI A, 02H ; Primeiro número
MVI B, 03H ; Segundo número
ADD B ; A+B and will be stored in A
STA 2052H ; Store acumulated content(sta)
HLT ; Stop the programm execution - Para o programa

; Nesse caso:
; 02H + 03H = 05H
; E esse valor é armazenado em 2052 (endereço de memória)
