PrintString: # Show String A1
	addi sp,sp,-4		# Backup Return address (PUSH RA) 
	sw ra,0(sp)    
		li a2,255
	
PrintStringAgain:
		lbu a0,0(a1)			  # Load unsigned byte
		beq a0,a2,PrintStringDone # Compare to 255 and branch if equal
		jal PrintCharA0  			  # Call PrintChar subroutine
	addi a1,a1,1			  # Move to next character
		j PrintStringAgain
PrintStringDone:
	lw ra,0(sp)  		# Restore Return address (POP RA) 
	addi sp,sp,4
	ret					# Return to RA
   

