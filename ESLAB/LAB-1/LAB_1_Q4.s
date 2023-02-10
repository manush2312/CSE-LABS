; program to reverse the array
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
	MOV R6, #10  ; r6 = 10 acts as counter
	LDR R4, =1   ; r4 = 1
	
	; this is for storing the data into the SRC memory location..
LOOP STR R4, [R0]  ; storing the contents of R4 to the location pointed by the R0 or SRC
	ADD R4, #1    ; incrementing the R4
	ADD R0, #4   ; adding 4 as to go on the next location
	SUBS R6, #1   ; we are using the SUBS because we dont have to compare the R6 to 0, when R6 becomes zero status flags changes and normally BNE command checks the status flag and when status flag becomes zero BNE end the loop.
	BNE LOOP
	
	LDR R0, =SRC  ; storing the initial location of SRC
	LDR R1, =SRC  ; initiallly storing the initial location of SRC
	ADD R1, #36   ; now R1 is pointing to the last location of SRC..
	MOV R5, #5    ; acting as a counter
	
	
	; for reversing the array..
UP LDR R2,[R0]
	LDR R3, [R1]
	STR R2, [R1]
	STR R3, [R0]
	SUBS R5, #1
	BNE UP
STOP 
	B STOP
	AREA mydata, DATA, READWRITE ; we cannot store any number or anything in DATA memory, we need to manually add it..
SRC DCD 0 
	END
	