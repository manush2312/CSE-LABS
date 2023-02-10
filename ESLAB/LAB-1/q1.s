	AREA RESET, DATA, READONLY ; assigning the area in the memory of name RESET and type DATA and access of readonly
	EXPORT __Vectors ; contains the address of code that needs to be executed
__Vectors ; label
	DCD 0x10001000 ; this represents a 32 bit
	DCD Reset_Handler ; code that needs to be executed after power up is located in the reset handler
	ALIGN 
	AREA Mycode, CODE, READONLY  ; assigning the area in the memory of name Mycode and type CODE and access of readonly
	ENTRY
	EXPORT Reset_Handler
Reset_Handler  ; contains the code that needs to be executed first
	MOV R0,#10
	MOV R1,#3
	ADD R0,R0,R1
HERE B HERE   ; to stop the execution or STOP B STOP
	END