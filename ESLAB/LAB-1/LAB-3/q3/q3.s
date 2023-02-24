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
		LDR R0,=N1
		LDR R1,[R0]
		LDR R0,=N2
		LDR R2,[R0]
		MUL R3,R1,R2
		LDR R6,=GCD
		LDR R7,=LCM
		MOV R8,#0
BACK	CMP R1,R2
		BEQ UP
		BCS DOWN
		SUB R2,R1
		B BACK
DOWN	SUB R1,R2
		B BACK
UP		SUB R3,R3,R2
		ADD R8,#1
		CMP R3,R2
		BGE UP
		STR R8,[R7]
		STRB R2,[R6]
STOP	B STOP
N1 DCD 30
N2 DCD 42
		AREA mydata,DATA,READWRITE
GCD DCD 0
LCM DCD 0
		END