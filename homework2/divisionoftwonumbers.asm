; O programa realiza a divisão de dois números de 8 bits
; O microprocessador não possui uma forma/método de dividir, dessa modo, faremos subtrações sucessivas para encontrar o valor para o usuário

; 10 ÷ 2 = 5
; 10 (DIVIDENDO) ÷ 2 (DIVISOR) = 5 (quociente/resultado)


.org 2000h ; Inicia o programa

LXI H, CO50H ; input (first data/dividendo)
MOV B, M ; ( B <- 0AH)
INX H ;
MOV C, M ; (C <- 02H)
MVI D, 00H
MOV A,B ; (A <- 0AH) (OAH-02H)
loop: SUB C ; (C <- 08H)... (C <- 06H)... (C <- 04H)... (C <- 02H)... (C <- 00H)
INR D
CMP C
JNC loop
STA C053H
MOV A, D ; (A <- 05H ~RESULTADO)
STA C052H

HLT ; Finaliza o programa
