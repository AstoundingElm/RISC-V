.include "Data.S"

.text 
main: 


jal BasicMaths
	li ra,0

jal MonitorA0A1A2
#	MonitorA0A1RAPCm
PrintRegNumA1 0x50000

PrintVar(msg2)
jal NewLineA1

li a1, 0x1000
jal ShowRegA1

jal NewLineA1

exit
.include "Monitor.S"
.include "pfuncs.S"	
.include "String.S"
.include "ShowRegs.S"
.include "Maths.S"
.include "MonitorA0A1A2.S"