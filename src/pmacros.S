
.macro PrintRegNumA1(%msg )
li a1, %msg
jal ShowRegA1
.end_macro

.macro PrintChA0(%msg)
li a0, %msg
jal PrintCharA0
.end_macro

.macro PrintVar(%msg)
la a1, %msg
jal PrintString

.end_macro

.macro exit

	li a0, 0
	li a7, 93
	ecall

.end_macro

.macro createAndPrintData(%msg, %msgName)

.data

%msgName:

.ascii %msg
.byte 255

.text

PrintVar(%msgName)
jal NewLineA1
.end_macro