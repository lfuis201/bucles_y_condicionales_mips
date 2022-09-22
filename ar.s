.data
    array_1: .word 1:10
.text
main:

    li $t0, 0
    la $t1, array_1
loop1: # set values
    bge $t0, 10, end_loop1

    # read int
    li $v0, 5 
    syscall 
    move $t3, $v0

    sw $t3, 0($t1) # set value

    add $t1, $t1, 4 # increment pointer
    add $t0, $t0, 1 # i++
    j loop1
end_loop1:

    li $t0, 0
    la $t1, array_1
loop2:
    # show values
    bge $t0, 10, end_loop2
    lw $t2, 0($t1)
    add $t1, $t1, 4
    

    # print value
    li $v0, 1
    move $a0, $t2
    syscall
    
    # print space
    li $a0, 32
    li $v0, 11
    syscall

    add $t0, $t0, 1 #  i++
    
    j loop2

end_loop2:
    jr $ra