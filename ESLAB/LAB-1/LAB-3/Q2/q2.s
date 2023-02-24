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
		LDR R0, = N1
		LDR R1, [R0]
		LDR R6, =DST
		MLA R2, R1,R1,R1  ; R2 = 10*10 + 10 
		LSR R2,#1  ; we are doing this because to divide by 2
		STR R2, [R6]
		
		
N1 DCD 10
		AREA mydata, DATA , READWRITE
DST DCD 0
		END