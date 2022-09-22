
.data

msg1: .asciiz "\nIngrese una palabra-1: "
msg2: .asciiz "\nIngrese una palabra-2: "
msg3: .asciiz "Iguales\n"
msg4: .asciiz "No son iguales\n"
endline: .asciiz "\n"
string1: .space 100
string2: .space 100

.text
main:
    # imprimimos el msg1
    li $v0, 4
    la $a0, msg1
    syscall

    # recibimos el ingreso del usuario para el primer string
    li $v0, 8
    la $a0, string1
    li $a1, 99
    syscall

    # imprimimos el msg2
    li $v0, 4
    la $a0, msg2
    syscall

    # recibimos el ingreso del usuario para el segundo string
    li $v0, 8
    la $a0, string2
    li $a1, 99
    syscall

    lb $t5, endline

    # cargamos los strings
    la $t1, string1
    la $t2, string2

    loop:
        # cargamos los caracteres de los strings
        lb $t3, 0($t1)
        lb $t4, 0($t2)

        # si no son iguales detenemos el loop si no continuamos en continueEqual
        sub $t6, $t3, $t4

        beq $t6, $zero, continueEqual
        j end_loop

    continueEqual:
        # si t3 y t4 es igual a vacio detenemos el bucle
        beq $t3, $t5, end_loop

        # incrementamos los inices del string en 1
        addi $t1, $t1, 1
        addi $t2, $t2, 1
        j loop

    end_loop:

        # si t6 es igual en ambos strings vamos a same sino no son iguales
        beq $t6, $zero, same

        notSame:
        # imprimimos que no son iguales
        li $v0, 4
        la $a0, msg4
        syscall
     
        same:
            # imprimimos que son iguales
            li $v0, 4
            la $a0, msg3
            syscall

exit:
    li $v0, 10
    syscall
