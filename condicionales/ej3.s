.data
    msg1: .asciiz "\nIngrese un numero: "
    msg2: .asciiz "\nIngrese otro numero: "
    msg6: .asciiz "\nLa division es: "
    error: .asciiz "\nError"
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

    # imprimimos el segundo mensaje
    li $v0,4
    la $a0,msg2
    syscall

    # recibimos el ingreso del usuario en $t2
    li $v0,5
    syscall
    move $t2,$v0

    # si t2 es 0 imprimoms el error sino imrpimimos la division
    beq $t2, 0, Else
    
    # imprimimos que es menor 
    li $v0,4
    la $a0,error
    syscall
    
    # y terminamos el programa
    j Endif

    Else:
        # realizamos la division en $t6
        div $t6,$t1,$t2
        # imprimimos el msje de division
        li $v0,4
        la $a0,msg6
        syscall

        # imprimimos la division
        li $v0,1
        move $a0,$t6
        syscall
    Endif:

    li $v0,10
    syscall
