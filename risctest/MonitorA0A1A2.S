MonitorA0A1A2:
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
		jal NewLineA1         
	popAs
	pop ra
	ret
  