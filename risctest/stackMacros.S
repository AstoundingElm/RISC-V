.macro push(%reg)

addi sp, sp, -4
	sw %reg, 0(sp)
.end_macro

.macro pop(%reg)
	lw %reg, 0(sp)
	addi sp, sp, 4
.end_macro




.macro pushAs
	  addi sp,sp,-32
      sw a0,0(sp)
      sw a1,4(sp)
      sw a2,8(sp)
      sw a3,12(sp)
      sw a4,16(sp)
      sw a5,20(sp)     
      sw a6,24(sp)
      sw a7,28(sp)
.end_macro

.macro popAs
      lw a0,0(sp)
      lw a1,4(sp)
      lw a2,8(sp)
      lw a3,12(sp)
      lw a4,16(sp)
      lw a5,20(sp)
      lw a6,24(sp)
      lw a7,28(sp)
      addi sp,sp,32
.end_macro


.macro pushall
	push ra
	pushAs
	pushSs
	pushTs
.end_macro

.macro popall
	popTs
	popSs
	popAs
    pop ra
.end_macro

