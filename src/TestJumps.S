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
exit
	
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
