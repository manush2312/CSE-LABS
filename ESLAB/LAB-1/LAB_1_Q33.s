	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	ALIGN 
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0, =SRC ; storing the address of src
	LDR R1, =DST  ; storing the address of dst
	MOV R2, #10  ; acting as a counter..
	SUB R0, #4   ; 
	SUB R1, #4
L1 LDR R3, [R0,#4]!  ; this is a loop and [R0,#4]! is a write back function
	STR R3, [R1,#4]!
	SUB R2, #1
	CMP R2, #0  ; comparing that the r2 is not zero
	BNE L1
STOP 
	B STOP 
SRC DCD 11,12,13,14,15,16,17,18,19,20  ; 
	AREA mydata ,DATA, READWRITE
DST DCD 0
	END