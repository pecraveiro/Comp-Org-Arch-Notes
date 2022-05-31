; O programa faz a soma de dois números mas ainda não indica a flag de carry

.org 2000H

LXI H, 2050H ; Take the first input, no endereço 2050
MOV A, M ; the content of the memory is copied in the accumullator
INX H ; incrementa para o endereço 2051H
ADD M ; A => A+M
STA 2052H ; por ex: 07H+05H = 0CH (12)
HLT
