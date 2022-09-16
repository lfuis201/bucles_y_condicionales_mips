.data 
    msg1: .asciiz "\nIntroduce un numero: "
    prime: .asciiz "\nEs primo"
    notPrime: .asciiz "\nNo es primo"
.text
main:
    # imprimimos el primer msj
    li $v0, 4
    la $a0, msg1
    syscall

    # input del usuario
    li $v0,5
    syscall
    move $t1, $v0

    # inicialiazamos t2 en 2
    li $t2, 2

    # si es 1 no es primo
    blt $t1, 1, isNotPrime
    beq $t1, 1, isNotPrime
    # si es 2 es primo
    beq $t1, 2, isPrime

    loop:

        # procesar los numeros entre t2 y t1
        beq $t2, $t1, isPrime
        # divie los numeros
        div $t1, $t2
        # asignamos la divisiom a t3
        mfhi $t3
        # si es o no es primo
        beq $t3, $0, isNotPrime

        # incrementamos t2
        addi $t2, $t2, 1

        b loop

isPrime:

    # imprimimos que es primo
    li $v0, 4
    la $a0, prime
    syscall

    b exit

isNotPrime:

    # imprimimos que no es primo
    li $v0, 4
    la $a0, notPrime
    syscall

    b exit

exit:
li $v0, 10
syscall
