; Sequência de Fibonacci: 0, 1, 1, 2, 3, 5, 8, 13 (D em hexadecimal), ...

.org 1500h

MVI C, 09H ; move o dado para o registro
LXI H, 2000H ; Onde os números começam a ser armazenados
MVI A, 00H ; move o dado para o registro
MOV M, A ; Move conteúdo de registro para memória apontada por HL
INR A ; Incrementa de um o conteúdo de memória apontado por HL
INX H ; Incrementa de um o conteúdo do registrador
loop: MOV M, A 
DCX H ; Decrementa um o conteúdo de um par de registradores
ADD M ; Adiciona conteúdo de memória apontado por HL
INX H ; Incrementa de um o conteúdo
INX H ; Incrementa de um o conteúdo
DCR C ; Decrementa de um o conteúdo da memória apontada por HL
JNZ loop
HLT ; Finaliza o programa

; 2000H - 00h
; 2001H - 01h
; 2002H - 01h
; 2003H - 02h
; 2004H - 03h
; 2005H - 05h
; 2006H - 08h
; 2007H - 0Dh
; 2008H - 15h
; 2009H - 22h
