
ShowRegA1:
	
	addi sp,sp,-4		# Backup Return address (PUSH RA) 
  	sw ra,0(sp)    
		li a0,'A'		# Show our header 'A1:'
		jal PrintCharA0
		li a0,'1'
		jal PrintCharA0
		li a0,':'
		jal PrintCharA0
	
		mv a3,a1		# A3 is our work var
	  	li a4,8			# We're showing 8 chars
ShowRegsHexAgain:  
        srli a0,a3,28	# Leftmost nibble to rightmost 
        slli a3,a3,4    # Remove leftmost nibble from A3

		andi a0,a0,0xF	# Mask leftmost nibble
		addi a0,a0,'0'	# Add Ascii 0
		
		li t0,':'  		# For comparison
		blt a0,t0,ShowHexCharOk #See if we're >9
		addi a0,a0,7	# Fix A-F
ShowRegsHexCharOk:
		jal PrintCharA0	# Show Character
      	addi a4,a4,-1
      	bne a4,zero,ShowRegsHexAgain	 # Compare to Zero (x0)
      	
 		li a0,' '
		jal PrintCharA0	# Print a space ' ' 
  	lw ra,0(sp)
  	addi sp,sp,4
			# Restore Return address (RA)
	ret					# Return to RA


