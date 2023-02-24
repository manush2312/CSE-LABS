	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0, =SRC ;loading the addresss of src
	LDR R1, =DST   ;loading the address of DST
	LDR R2, [R0] 
	MOV R3, #1
	MOV R4, #0XA
	MOV R5, #0
	MOV R7, #0XF ;FOR MASKING PURPOSE
UP	MOV R6, R2
	AND R6, R7
	MLA R5, R6, R3, R5
	MUL R3, R4
	LSR R2, #4
	CMP R2, #0
	BNE UP
	STR R5, [R1]
STOP 
 	B STOP
SRC DCB 0x25
	AREA mydata, DATA, READWRITE
DST DCD 0
	END