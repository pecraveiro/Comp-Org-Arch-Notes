; O programa faz a adição de dois números com a adição de carry se necessário

; Exemplo:
; F1 (hexa) -> 11110001 (binária)
; 15 (hexa) -> 00010101 (binária)
; Somando:     --------
;          (1) 00000110 (CARRY gerado)

; Iniciando o programa
.org 2000H

LXI H, 2050H ; First Input - Primeiro input nesse endereço de memória - Carrega um par de registradores com um dado imediato
MOV A, M ; A <- "A", now contains the input
INX H ; Incrementa o endereço de memória para 2051H
MVI B, 00H ; Carrega o registrador com um dado imediato
ADD M ; Soma o conteúdo
JNC loop ; JNC - Jump if carry is not generate / Jump if no carry
INR B ; (B <- B+1 <- 01H)
loop: STA 2052H ; Armazena em endereço o conteúdo do acumulador
MOV A,B ; Move conteúdo de B para A
STA 2053H ; Armazena em endereço o conteúdo do acumulador
HLT ; Para o microprocessador
