.data
    msg1: .asciiz "\nCual es tu edad: "
    msg2: .asciiz "\nCuales son tus ingresos mensuales: "
    true: .asciiz "\nTienes que cotizar"
    false: .asciiz "\nNo tienes que cotizar"
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

    # recibimos el ingreso del usuario en $t1
    li $v0,5
    syscall
    move $t2,$v0

    # si t1 es menor de 16 en otro caso vamos al Else
    slt $t5, $t1, 16
    slt $t5, $t2, 1000
    beq $t6, 0, Else
    
    # imprimimos msje de false
    li $v0,4
    la $a0,false
    syscall
    
    # y terminamos el programa
    j Endif

    Else:
        # imprimimos el msje de true
        li $v0,4
        la $a0,true
        syscall

    Endif:

    li $v0,10
    syscall
