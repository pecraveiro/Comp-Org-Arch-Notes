; Pedro M S Craveiro - UFSC - Org e Arq de Comp.

.org 0000H ; Starts the programm - Simmulator 8085

START:      LXI H,0000H  ; Load 0000H value in HL register pair

Hour_Min:   SHLD 5001H   ; Store HL pair value at 5001H(L)and 5002H(H)
            XRA A  	     ; XOR between A and A => Clear register A

sec_min_hr: STA 5000H        ; Store accumulator content at 5000H
	    CALL sec_delay   ; Delay of 1 sec
	    LDA 5000H        ; Load content from location 5000H to accumulator
	    ADI 01H	         ; Add 01H to accumulator
	    DAA		           ; Ajust decimal => To convert HEX to Decimal format
	    MOV E,A          ; Register display
	    CPI 60H          ; Compare accumulator value with 60H (In decimal here) i.e.60 sec
	    JNZ sec_min_hr   ; If false,then go to sec_min_hr,otherwise continue below

	    XRA A            ; Clear value of accumulator
            STA 5000H        ; Store the value of accumulator to 5000H
	    MOV E,A          ; Move value of A to E => For displaying purpose
	      
	    LHLD 5001H	     ; Load HL pair value from address 5001H(L) and 5002H(H)
	    MOV A,L          ; Move value of L to accumulator
	    ADI 01H          ; Add 01H to accumulator
	    DAA		     ; Ajust decimal => To convert HEX to Decimal format
	    MOV L,A          ; Move value of accumulator to L
	    CPI 60H          ; Compare accumulator value with 60H (In decimal here) i.e.60 min
	    JNZ Hour_Min     ; If false, then go to Hour_Min, otherwise continue below

	    XRA A            ; Clear value of accumulator
            STA 5001H        ; Store the value of accumulator to 5001H
	    MOV L,A          ; Move value of A to L => For displaying purpose
 
	    MOV A,H	     ; Move value of H to accumulator
	    ADI 01H	     ; Add 01H to accumulator
	    DAA		     ; Ajust decimal => To convert HEX to Decimal format
	    MOV H,A          ; Move value of A to H => For displaying purpose
	    CPI 24H          ; Compare accumulator value with 24H (In decimal here) i.e.24 hour
	    JNZ Hour_Min     ; If it is false, then go to Hour_Min otherwise continue below

	    JMP START  	     ; Jump to the beginning of program

; Delay program ==> To make a delay of 1 sec when called

sec_delay:  MVI D,02H        ; 7T     Move value 02H to register D => Outer loop
Outer_loop: LXI B,0FFFFH     ; 10T    Move value FFFFH (65535) to register pair BC => Inner loop
Inner_loop: DCX B            ; 6T     Decrease value of BC pair (Inner loop)
	    MOV A,B          ; 4T     Delay time: Move value of register B to Accumulator
	    ORA C            ; 4T     Performs OR operation between Accumulator and regsiter C
	    JNZ Inner_loop   ; 10/7T  If value of BC pair is still not zero, then go to Inner_loop, otherwise continue
	    DCR D            ; 4T     If value of BC pair is zero, then decrese value of register D
	    JNZ Outer_loop   ; 10/7T  If value of register D is not zero, then go to Outer_loop, otherwise continue
	    RET		     ; 10T    Return from sub-routine => program control is transferred back to main program

; Calculation: (7+2*(10+65535*(6+4+4+10)-3+4+10)-3+10)T = 3145736T
; 1 T = 1/3*10^6 sec
; 3145736T = 1.04857 seconds, which is approximately 1 sec
