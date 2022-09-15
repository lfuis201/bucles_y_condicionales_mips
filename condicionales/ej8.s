.data
    msg1: .asciiz "\nIntroduce tu puntuacion: "
    msg2: .asciiz "\nTu nivel de rendimiento es: "
    msg3: .asciiz "\nte corresponde cobrar: "
    res: .space 20
    a: .asciiz "Inaceptable"
    ba: .asciiz "Aceptable"
    c: .asciiz "Meritorio"
.text

    # imprimimos el primer mensaje
    main:
    li $v0,4
    la $a0,msg1
    syscall

    # recibimos el ingreso del usuario en $f0
    li $v0,6
    syscall
    mfc1 $t1,$f0

    # asignamos 100 a f4
    li.s $f1, 0.0
    # asignamos 100 a f4
    li.s $f2, 0.4
    # asignamos 100 a f4
    li.s $f3, 0.6

    # si f0 es igual a 0 sino vamos al else
    c.eq.s $f0, $f1
    bc1f Else
    # asignamos 0.0 a f4
    li.s $f4, 0.0

    # asignamos a t0 la variable a
    la $t0, a

    syscall

    j Endif

    # si f0 es igual a 0.4 sino vamos al else
    Else:
    c.eq.s $f0, $f2
    bc1f Else1
    # asignamos 0.4 a f4
    li.s $f4, 0.4

    # asignamos a t0 la variable ba
    la $t0, ba

    j Endif

    # si f0 es mayor igual a 0.6 sino vamos endif
    Else1:
    c.le.s $f3, $f0

    # asignamos 0.6 a f4
    li.s $f4, 0.6

    # asignamos a t0 la variable c
    la $t0, c

    j Endif

    Endif:

    # multiplicamos
    mul.s $f5,$f0,$f4


    # imprimimos el segundo msje
    li $v0,4
    la $a0,msg2
    syscall

    # imprimimos el viel que esta en t0
    move $a0, $t0
    li $v0,4
    syscall

    # imprimimos el tercer msje
    li $v0,4
    la $a0,msg3
    syscall


    # imprimimos el resultado
    li $v0,2
    mov.s $f12,$f5
    syscall

    li $v0,10
    syscall
