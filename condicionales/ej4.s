.data
    msg1: .asciiz "\nIngrese un numero entero: "
    par: .asciiz "\nEs par"
    impar: .asciiz "\nEs impar"
.text

    # imprimimos el primer mensaje
    main:
    li $v0,4
    la $a0,msg1
    syscall

    # recibimos el ingreso del usuario en $t1
    li $v0,5
    syscall
    move $t1,$v0

    # asignamos la division de t1 entre 2 a t6
    div $t6,$t1,2

    # si la division es 0 imprimimos que es par sino vamos al ese
    beq $t6, 0, Else
    
    # imprimimos msje de par
    li $v0,4
    la $a0,par
    syscall
    
    # y terminamos el programa
    j Endif

    Else:
        # imprimimos el msje de impar
        li $v0,4
        la $a0,impar
        syscall

    Endif:

    li $v0,10
    syscall
