 NewLineA1:
	push ra
		li a1,'\n'
		jal PrintCharA1
	pop ra
	ret
  
PrintCharA0: # Print Character A0
	li a7, 11		
	ecall			
	ret				

PrintCharA1: #;printchar A1
	push ra
	pushAs
		mv a0,a1
		li a7, 11
		ecall
	popAs
	pop ra
	ret


NewLineA0:
push ra
li a0, '\n'
pop ra
ret
