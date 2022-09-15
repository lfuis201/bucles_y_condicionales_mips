.data

msg: .asciiz "\nIngrese un palabra: "
buffer: .space 100

.text
main:

# imprimimos el primer mensaje
li $v0, 4
la $a0, msg
syscall

# recibimos el numero que el usuario ingreso en t1
li $v0,8

# asignamos el valor de 0 a t0

li $t0, 0
li $t1, 11
# creamos el bucle for
for:
# inicia en t0 y termina en 10

beq $t0,$t1,exit

# imprimir el numero
move $a0, $t2
li $v0,4
syscall

j for
exit:


li $v0, 10
syscall
