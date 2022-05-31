LXI H, 2050H ; take the first input
MOV A, M ;
INX H ; incrementa para 2051
ADD M ; A = A+M
STA 2052H ; 07H+05H = 0CH (12)
HLT
