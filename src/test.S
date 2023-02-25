.data

.globl __start

.include "pmacros.S"
#.include "Data.S"
#.include "DataMacros.S"
.include "BasicMacros.asm"
.macro MonitorA0A1RAPCmTestMemory
	push ra
		mv a6,ra
		jal MonitorA0A1RAPCTestMemory
	pop ra
.end_macro


.text 

__start: 
	li ra,0

	MonitorA0A1RAPCmTestMemory
jal NewLine

#j TestMemory
#j TestFunc
j TestJumps


.data
.include "Lesson1.asm"


#.include "Monitor.S"
#.include "pfuncs.S"	
#.include "String.S"
#.include "ShowRegs.S"
#.include "Maths.S"
#.include "MonitorA2Funcs.S"
#.include "MonitorA0A1A2.S"
