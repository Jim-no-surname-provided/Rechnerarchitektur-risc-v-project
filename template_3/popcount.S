init:	
	li a0, 0 #0
	call popcount
	sw a1, 512(zero)
	
	li a0, -1 #8
	call popcount
	sw a1, 516(zero)
	
	li a0, 98 #3
	call popcount
	sw a1, 520(zero)
	
	li a0, 170 # 4
	call popcount
	sw a1, 524(zero)

	j end

popcount:
	li a1, 0   # result
	li t0, 8  # loop counter
	slli a0, a0, 24
popcount_loop:
	blt a0, zero, popcount_count_up
	j popcount_shift	    
popcount_count_up:
	addi a1, a1, 1
popcount_shift:
	slli a0, a0, 1
	addi t0, t0, -1
	beq t0, zero, popcount_end
	j popcount_loop
popcount_end:
	ret
    
end:    
	li x5, 25
	sw x5, 100(zero)
