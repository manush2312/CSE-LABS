		AREA RESET,DATA,READONLY
		EXPORT __Vectors
__Vectors
		DCD 0x10001000
		DCD Reset_Handler
		ALIGN
		AREA mycode,CODE,READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
		LDR R0, =N1 ; storing the address of N1
		LDR R1 , [R0] ; R1 = 21
		LDR R0, =N2 
		LDR R2,[R0] ; R2 = 7
		MOV R3, #0 ; R3 = 0 this will store quotient
		MOV R4, #0 ; R4 = 0 this will store remainder
		LDR R6, =DST

UP 		SUB R1,R1,R2
		ADD R3,#1 ; incrementing the quotient by one 
		CMP R1,R2
		BGE UP
		STR R3, [R6], #4  ; storing the quotient in upper bits 
		STR R1, [R6]    ; storing the remainder in lower bits
STOP 
		B STOP 
		

N1 DCD 22
N2 DCD 7
	
		AREA mydata, DATA, READWRITE
DST DCD 0
	END