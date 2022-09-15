.data
    msg1: .asciiz "\nIntroduce tu edad: "
    msg2: .asciiz "\nEl precio de tu entrada es: "
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

    # si t1 es menor a 4 sino vamos al else
    slt $t5, $t1, 4
    beq $t5, 0, Else
    
    # signamos 0 a t3
    li $t3,0
    
    j Endif

    # si t1 es menor a 35000 sino vamos al else1
    Else:
    slt $t5, $t1, 19
    beq $t5, 0, Else1

    # signamos 4 a t3
    li $t3,4

    j Endif

    Else1:

    # signamos 10 a t3
    li $t3,10

    j Endif

    Endif:


    # imprimimos el seguno msje
    li $v0,4
    la $a0,msg2
    syscall

    # imprimimos el resultado
    li $v0,1
    move $a0, $t3
    syscall

    li $v0,10
    syscall
