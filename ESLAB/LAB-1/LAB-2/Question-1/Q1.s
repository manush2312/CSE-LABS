; Write a program to add ten 32 bit numbers available in code memory and store the result in data memory.

	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	ALIGN 
	AREA mycode , CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0, =ARRAY ; stroing the address of the first location
	MOV R1, #10  ; acting as counter
	MOV R2, #0  ; final value will be stored in the R2.. 
	LDR R4 , =sum ; storing the address of the data memory or sum 
LOOP LDR R3, [R0]  ; loading the contents of location pointed by R1 to the R3
	ADD R2,R3
	ADD R0, #4
	SUBS R1, #1
	BNE LOOP
	
	STR R2, [R4] 




ARRAY DCD 11,12,13,14,15,16,17,18,19,20
	AREA sum , DATA, READWRITE
DST DCD 0
	END
