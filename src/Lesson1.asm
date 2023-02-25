
#.include "stackMacros.S"


.text

#	TestFunc:


#	li ra,0

#	MonitorA0A1RAPCmTestMemory
#jal NewLine
#	j TestMemory
#	j TestJumps
 
TestMemory:
	
	li a1,0				#;Clear a1
	
	la a7,TestData		#;Address
	li a6,2				#;Line Count
	jal MemDump			#;Dump Ram to screen
	
	jal NewLine  
	
	la a2,TestData		#;Load address of TestData
	lw a0,(a2)			#;Load Word (32 bit) into A0 from address in A2
	jal MonitorA0A1A2TestMemory 	
	
	lhu a0,(a2)			#;Load Half (16 bit) (other bits 0)
	lh a1,(a2)			#;Load Half (16 bit) (other bits bit15)
	jal MonitorA0A1A2TestMemory	
	
	lbu a0,(a2)			#;Load Byte (other bits 0)
	lb a1,(a2)			#;Load Byte (other bits bit7)
	jal MonitorA0A1A2TestMemory	
	
	jal NewLine  
	
	la a7,TestData		#;Address
	li a6,2				#;Line Count
	jal MemDump			#;Dump Ram to screen
	
	lw a0,(a2)			#;Load Word into A0 from address in A2
	jal MonitorA0A1A2TestMemory 	
	
	jal NewLine  
	
	sw a2,(a2)			#;Store Word from A0 into address in A2
	sw a0,4(a2)			#;Store Word from A0 into address in A2+4
		
	sh a0,8(a2)			#;Store HalfWord from A0 into address in A2+8
	
	sb a0,12(a2)		#;Store Byte from A0 into address in A2+12
	
	la a7,TestData		#;Address
	li a6,2				#;Line Count
	jal MemDump			#;Dump Ram to screen
	
	
	#;la a7,TestDataB		#;This doesn't work as its not in the data area
	#;li a6,2				#;Line Count
	#;jal MemDump			#;Dump Ram to screen

	j Shutdown
TestDataB:
	nop 
	nop 
	nop 
	nop 
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
TestJumps:	

	j JumpTest1			#;Jump to a label
ReturnFromJumpB:
	
	la a0,JumpTest2		#;Jump to address in Register
	jr a0
ReturnFromJump:

	jal JumpTest3		#;Jump And Link to label (PC->RA)
	
	jal a1,JumpTest3b	#;Jump And Link to label (PC->A1)

	la a0,JumpTest4		
	jalr a0		#;Jump And Link to address in Register (A0->RA)
	#;jalr ra,a0,0		#;Alternate form of JALR command
	
	jal NewLine  	
	j Shutdown
	
JumpTest1:
	MonitorA0A1RAPCmTestMemory
	la a2,JumpTo
	jal PrintString
	push ra
		jal NewLine       
	pop ra
	j ReturnFromJumpB
	
JumpTest2:
	MonitorA0A1RAPCmTestMemory
	la a2,JumpToRegister
	jal PrintString
	push ra
		jal NewLine       
	pop ra
	j ReturnFromJump
  	
JumpTest3:
	MonitorA0A1RAPCmTestMemory
	push ra
		la a2,JumpAndLinkTo
		jal PrintString
		jal NewLine       
	pop ra
	ret		#;jr RA
	
JumpTest3b:
	MonitorA0A1RAPCmTestMemory
	push a1
		la a2,JumpAndLinkTo
		jal PrintString
		jal NewLine       
	pop a1
	jr a1 #;ret
	
	
JumpTest4:
	MonitorA0A1RAPCmTestMemory
	push ra
		la a2,JumpAndLinkToRegister
		jal PrintString
		jal NewLine       
	pop ra
	ret		#;jr RA
	
Shutdown:
	#; ends the program with status code 0
	li a7, 10
	ecall
  
 #;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 

MonitorA0A1RAPCTestMemory:
	pushAs
	push ra
		push a6
			li a5,'a'
			li a6,'0'
			mv a7,a0
			jal ShowRegTextB             #   ;A5 A6 : A7
			li a5,'a'
			li a6,'1'
			mv a7,a1
			jal ShowRegTextB             #   ;A5 A6 : A7
			li a5,'r'
			li a6,'a'
		pop a7
		jal ShowRegTextB             #   ;A5 A6 : A7
		li a5,'p'
		li a6,'c'
	pop a7
	push a7
		jal ShowRegTextB             #   ;A5 A6 : A7  
	pop ra
	popAs
	ret
 
MonitorA0A1A2TestMemory:
	push ra
	pushAs
	    li a5,'a'
		li a6,'0'
		mv a7,a0
		jal ShowRegTextB             #   ;A5 A6 : A7
		li a5,'a'
		li a6,'1'
		mv a7,a1
		jal ShowRegTextB             #   ;A5 A6 : A7
		li a5,'a'
		li a6,'2'
		mv a7,a2
		jal ShowRegTextB             #   ;A5 A6 : A7
		jal NewLine         
	popAs
	pop ra
	ret
 
.include "monitor.asm"  
.include "BasicFunctions.asm"  
  
#;All Data must go in the Data Segment - cannot read from code segment
.data

TestData:
	.byte 0xF0,0xF1,0xF2,0xF3	#;Little Endian - so this is $F3F2F1F0
	.byte 0,0,0,0,0,0,0,0,0,0,0,0

JumpAndLinkTo: 
  .string "JAL "
  .byte 255 
JumpTo: 
  .string "J   "
  .byte 255 
JumpToRegister: 
  .string "JR  "
  .byte 255 
JumpAndLinkToRegister: 
  .string "JALR"
  .byte 255 
