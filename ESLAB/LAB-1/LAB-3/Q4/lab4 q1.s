AREA RESET,DATA,READONLY
	EXPORT_VECTORS
	_VECTORS
	DCD0X10001000
	DCD RESET_HANDLER
		ALIGN
			AREA mycode,CODE,READONLY
				ENTRY
				EXPORT Reset_Handler
					Reset_Handler
					LDR R0,=N1
					LDR R1,=DST
					LDR R2,[R0]
					MOV R3,#1
					MOV R4,#0XA
					MOV R5,#0
					MOV R7,#0XF
	UP				MOV R6,R2
	                AND R6,R7
					MLA R5,R6,R3,R5
					MUL R3,R4
					LSR R2,#4
					CMP R2,#0
					BNE UP
					STR R5,[R1]
					STOP
					B STOP
					N1 DCD 0X11223456
						AREA mydata,DATA.READWRITE
							DST DCD 0
								END
					
					