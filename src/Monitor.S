howRegTextB:
	push ra
	push a0
	push a1
	push a3
		jal ShowRegText
	pop a3
	pop a1
	pop a0
	pop ra
	ret
	
ShowRegTextB:
	push ra
	push a0
	push a1
	push a3
		jal ShowRegText
	pop a3
	pop a1
	pop a0
	pop ra
	ret
	

ShowHex4:
  addi sp,sp,-4
  sw ra,0(sp)    
  li a4,8
ShowHex4Again:  
        srli a1,a3,28
        slli a3,a3,4
        jal ShowHexChar
      addi a4,a4,-1
      bne a4,x0,ShowHex4Again
  lw ra,0(sp)
  addi sp,sp,4
  ret 

ShowHexChar:
	push ra
	pushAs
		addi sp,sp,-4
		sw ra,0(sp)
		andi a1,a1,0xF
		addi a1,a1,'0'
		li t0,':'
		blt a1,t0,ShowHexCharOk
		addi a1,a1,7
ShowHexCharOk:
		jal PrintChar
		lw ra,0(sp)
		addi sp,sp,4
	popAs
	pop ra
  ret 

PrintChar:
  addi sp,sp,-4
  sw ra,0(sp)
    addi sp,sp,-4
  sw a0,0(sp)
      addi sp,sp,-4
  sw a7,0(sp)
	mv a0,a1
    li a7, 11
    ecall
  lw a7,0(sp)
  addi sp,sp,4
  lw a0,0(sp)
  addi sp,sp,4
  lw ra,0(sp)
  addi sp,sp,4
  ret

ShowRegText:            #    ;A5 A6 : A7
  # addi sp,sp,-4
  # sw ra,0(sp)
  push ra
     mv a1,a5
     jal PrintChar
     mv a1,a6
     jal PrintChar
  j ShowRegB
  
ShowReg:            #    ;A5 A6 : A7
	push ra
  #; addi sp,sp,-4
  #; sw ra,0(sp)
     mv a1,a5
     jal PrintChar
     mv a1,a6
     jal ShowHexChar
ShowRegB:            #   h ;A5 A6 : A7
     li a1,':'
    jal PrintChar
    mv a3,a7
    jal ShowHex4
    li a1,' '
    jal PrintChar
    addi a6,a6,1
	pop ra
  #; lw ra,0(sp)
	#; addi sp,sp,4
  ret

MonitorA0A1RAPC:
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