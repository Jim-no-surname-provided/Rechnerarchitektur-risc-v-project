.globl main

.text

L7:
    lw x6, -4(x9)
L6: sw x6, 4(x9) 
    or x4, x5, x6
    beq x4, x3, end
    jal x0, end
main:
    jal x4, L7	
end:
	li x5, 25
	sw x5, 100(zero)
