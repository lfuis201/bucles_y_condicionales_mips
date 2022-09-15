.data
    newLine: .asciiz "\n"
    espacio: .asciiz " "
.text
    main:
        # cargar 0 en t0
        li $t0, 0

    outerLoop:
        #(for i=0;i<=10;i++)
        # if t0=s0 ir a end
        beq $t0, 10, end
        
        # increment i
        addi $t0, $t0, 1

        # cargar 1 en t1
        li $t1, 1

        # saltar a changeline
        jal changeLine 

    innerLoop:
        #(for j=0;10;j++)
        # if t1=t0 branch to outerLoop
        bgt $t1, 10, outerLoop

        mul $t3, $t1, $t0
        # imprimimos el numero
        li $v0,1
        move $a0,$t3
        syscall

        # Imprimimos el espacio
        li $v0, 4
        la $a0, espacio
        syscall 
    
        # incrementamos j
        addi $t1, $t1, 1

        # saltamos al innerLoop
        j innerLoop

    changeLine:

        # Imprimimos la nueva linea
        li $v0, 4
        la $a0, newLine
        syscall 

        jr $ra

    end:
        li $v0, 10
        syscall