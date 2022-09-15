.data

msg: .asciiz "\nIngrese un numero entero positivo: "

.text
main:

# imprimimos el primer mensaje
li $v0, 4
la $a0, msg
syscall

# recibimos el numero que el usuario ingreso en t1
li $v0,5
syscall
move $t1,$v0

# asignamos el valor de 0 a t0

li $t0, 0
li $t5, 2
# creamos el bucle for
for:
# inicia en t0 y termina en t1

beq $t0,$t1,exit

addi $t0,$t0,1
div $t6, $t0, $t5

beq $t6, 0, Else

Else:
    li $v0,1
    move $a0, $t0
    syscall
    j Endif
Endif:

j for
syscall

exit:


li $v0, 10
syscall
