.data
    msg1: .asciiz "\nCual es tu renta anual: "
    msg2: .asciiz "\nTienes que pagar: "
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

    # si t1 es menor a 10000 sino vamos al else
    slt $t5, $t1, 10000
    beq $t6, 0, Else
    
    li $t3,5
    
    j Endif

    # si t1 es menor a 35000 sino vamos al else
    Else:
    slt $t5, $t1, 35000
    beq $t6, 0, Else1

    li $t3,15

    j Endif

    Else1:
    slt $t5, $t1, 60000
    beq $t6, 0, Else2
    
    li $t3,30

    j Endif

    Else2:

    li $t3,45

    j Endif

    Endif:

    # convertimos el t3 en float
    mtc1 $t3, $f3
    cvt.s.w $f3, $f3

    # convertimos el t1 en float
    mtc1 $t1, $f1
    cvt.s.w $f1, $f1

    # asignamos 100 a f4
    li.s $f4, 100.0

    # dividimos
    div.s $f11,$f3, $f4

    # multiplicamos
    mul.s $f7,$f11,$f1


    # imprimimos el seguno msje
    li $v0,4
    la $a0,msg2
    syscall

    # imprimimos el resultado
    li $v0,2
    mov.s $f12,$f7
    syscall

    li $v0,10
    syscall
