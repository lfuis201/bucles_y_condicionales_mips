.data
    msg1: .asciiz "Ingrese el tamano del triangulo: "
    newLine: .asciiz "\n"
    star: .asciiz "*"

.text
    main:
        li $v0, 4       # imprimir msg1
        la $a0, msg1
        syscall

        li $v0,5            # input del usuario
        syscall
        move $s0, $v0     # mover el input a s0

        # cargar 0 en t0
        li $t0, 0

    outerLoop:
        #(for i=0;i<=s0;i++)
        # if t0=s0 ir a end
        beq $t0, $s0, end
        
        # incrementamos i en 1
        addi $t0, $t0, 1

        # cargar 1 en t1
        li $t1, 1

        # saltar a changeline
        jal changeLine 

    innerLoop:
        #(for j=0;j<=i;j++)
        # if t1=t0 ir al primer loop
        bgt $t1, $t0, outerLoop

        # imprimimos el numero que esta en t1
        li $v0, 1
        move $a0, $t1
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