.data
    msg1: .asciiz "\nBienvenido a la pizzeria Bella Napoli.\nTipos de pizza\n\t1- Vegetariana\n\t2- No vegetariana\n"
    msg2: .asciiz "\nIntroduce el numero correspondiente al tipo de pizza que quieres: "
    msg3: .asciiz "\nIngredientes de pizzas vegetarianas\n\t 1- Pimiento\n\t2- Tofu\n"
    msg4: .asciiz "\nIntroduce el ingrediente que deseas: "
    pv: .asciiz "\nPizza vegetariana con mozzarella, tomate y "
    pnv: .asciiz "\nPizza no vegetarina con mozarrella, tomate y "
    pim: .asciiz "Pimiento "
    tofu: .asciiz "Tofu"
    ipnv: .asciiz "Ingredientes de pizzas no vegetarianas\n\t1- Peperoni\n\t2- Jamon\n\t3- Salmon\n"
    pep: .asciiz "peperoni"
    jam: .asciiz "jamon"
    sal: .asciiz "salmon"

.text
    main:
    # imprimimos el primer mensaje
    li $v0,4
    la $a0,msg1
    syscall

    # imprimimos el segundo mensaje
    li $v0,4
    la $a0,msg2
    syscall

    # recibimos el ingreso del usuario en $t1
    li $v0,5
    syscall
    move $t1,$v0

    beq $t1, 1, Veg

    li $v0,4
    la $a0,ipnv
    syscall

    # recibimos el ingreso del usuario en $t3
    li $v0,5
    syscall
    move $t3,$v0

    # si la opcion es 1 vamos a peperoni
    beq $t3, 1 peperoni
    beq $t3, 2 jamon
    beq $t3, 3 salmon
    peperoni:
        # si no imprimos piza no vegetariana con peperoni
        li $v0,4
        la $a0,pnv
        syscall

        li $v0,4
        la $a0,pep
        syscall

        j Exit
    jamon:
        # si no imprimos piza no vegetariana con jamon
        li $v0,4
        la $a0,pnv
        syscall

        li $v0,4
        la $a0,jam
        syscall

        j Exit
     # si la opcion es 2 vamos a salmon
    salmon:
        # si no imprimos piza no vegetariana con salmon
        li $v0,4
        la $a0,pnv
        syscall

        li $v0,4
        la $a0,sal
        syscall

        j Exit
    j Exit
    Veg:
        # imprimimos el msje de la piza vegetariana
        li $v0,4
        la $a0,msg3
        syscall

        # recibimos el ingreso del usuario en $t2
        li $v0,5
        syscall
        move $t2,$v0

        # si nuesstra opcion es 1 vamos a else1
        beq $t2, 1, Pim
        # imprimimos el msj de piza vegetariana con pimiento
        li $v0,4
        la $a0,pv
        syscall

        li $v0,4
        la $a0,tofu
        syscall
        j Exit

        Pim:
            # imprimimos el msj de piza vegetariana con pimiento
            li $v0,4
            la $a0,pv
            syscall

            li $v0,4
            la $a0,pim
            syscall
            j Exit
    Exit:
    li $v0,10
    syscall

    