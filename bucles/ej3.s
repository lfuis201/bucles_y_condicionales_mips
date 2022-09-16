.data
    msg1: .asciiz "\nIngrese un numero entero: "
    espacio: .asciiz ", "

.text
main:

# imprimimos el msg1
li $v0,4
la $a0,msg1
syscall

# recibimos el numero que el usuario ingreso en t1
li $v0,5
syscall
move $t1,$v0

# asignamos 1 a t0
addi $t2, $0, 1

# for(for i=0; i<=t1; i+=2)
loop:
    bgt $t2, $t1, exit
    # incrementamos t2 en 2
    addi $t2, $t2, 2

    # imprimimos el numero que esta en t2
    li $v0, 1
    move $a0, $t2
    syscall

    # imprimimos el msj de espacio
    li $v0,4
    la $a0,espacio
    syscall

    b loop
exit:


li $v0, 10
syscall
