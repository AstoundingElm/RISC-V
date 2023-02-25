
TestBasicMaths:	
	
    li a0,192			#;Load 192 in decimal (0xC0)
    li a1,0xFFEEDDCC	#;Load a hexadecimal value into A0
	li a2,'A'			#;load 'A' in ascii (0x41)
	jal MonitorA0A1A2 	#; Show A0,A1,A2 to screen
	
	li a0,0x01020304	#;Load a hexadecimal value into A0
	mv a1,a0			#;Move A0->A1
	mv a2,a0			#;Move A0->A2
	jal MonitorA0A1A2 	#; Show A0,A1,A2 to screen
	
.eqv  testSym,3		#;Define testSym=3
	
	li a0,testSym		#;Load a symbol
    li a1,testSym		#;Load a symbol
	li a2,testSym		#;Load a symbol
	jal MonitorA0A1A2 	#; Show A0,A1,A2 to screen
	
	li a0,192			#;Load 192 in decimal (0xC0)
	addi a1,a0,1		#; Add 1 to A0, store result in A1
	addi a2,a0,-1		#; Subtract 1 from A0, store result in A2
	jal MonitorA0A1A2 	#; Show A0,A1,A2 to screen
	
	li a0,192			#;Load 192 in decimal (0xC0)
	li a2,0x00000100	#;Value to add or subtract
	jal MonitorA0A1A2 	#; Show A0,A1,A2 to screen

	add a1,a0,a2		#;A1 = A0+A2
	sub a0,a0,a2		#;A0 = A0-A2
	jal MonitorA0A1A2 
exit