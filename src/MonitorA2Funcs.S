
ShowHexCharA2:
	push ra
	pushAs
		addi sp,sp,-4
		sw ra,0(sp)
		andi a1,a1,0xF
		addi a1,a1,'0'
		li t0,':'
		blt a1,t0,ShowHexCharOkA2
		addi a1,a1,7
ShowHexCharOkA2:
		jal PrintChar
		lw ra,0(sp)
		addi sp,sp,4
	popAs
	pop ra
  ret 

ShowHex4A2:
  addi sp,sp,-4
  sw ra,0(sp)    
  li a4,8
ShowHex4AgainA2:  
        srli a1,a3,28
        slli a3,a3,4
        jal ShowHexCharA2
      addi a4,a4,-1
      bne a4,x0,ShowHex4AgainA2
  lw ra,0(sp)
  addi sp,sp,4
  ret 

ShowRegTextBA2:
	push ra
	push a0
	push a1
	push a3
		jal ShowRegTextA2
	pop a3
	pop a1
	pop a0
	pop ra
	ret
	
ShowRegTextA2:            #    ;A5 A6 : A7
  # addi sp,sp,-4
  # sw ra,0(sp)
  push ra
     mv a1,a5
     jal PrintChar
     mv a1,a6
     jal PrintChar
  j ShowRegBA2
  
ShowRegA2:            #    ;A5 A6 : A7
	push ra
  #; addi sp,sp,-4
  #; sw ra,0(sp)
     mv a1,a5
     jal PrintChar
     mv a1,a6
     jal ShowHexChar
ShowRegBA2:            #   h ;A5 A6 : A7
     li a1,':'
    jal PrintChar
    mv a3,a7
    jal ShowHex4A2
    li a1,' '
    jal PrintChar
    addi a6,a6,1
	pop ra
  #; lw ra,0(sp)
	#; addi sp,sp,4
  ret
