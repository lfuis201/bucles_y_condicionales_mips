.data

msg: .asciiz "\nIngrese la cantidad a invertir: "
msg1: .asciiz "\nIngrese el interes porcentual anual: "
year: .asciiz "\nIngrese los anos: "
res: .asciiz "\nCapital tras "
res1: .asciiz " anos: "
line: .asciiz "\n"
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

# imprimimos el segundo mensaje
li $v0, 4
la $a0, msg1
syscall

# recibimos el interes en t2
li $v0,5
syscall
move $t2,$v0


# imprimimos los anos
li $v0, 4
la $a0, year
syscall

# recibimos los anos en t3
li $v0,5
syscall
move $t3,$v0


# asignamos el valor de 0 a t0

li $t0, 0
li.s $f4, 100.0
li.s $f11, 1.0

# convertimos el interes en float
mtc1 $t2, $f2
cvt.s.w $f2, $f2

# convertimos el monto(t1) en float
mtc1 $t1, $f1
cvt.s.w $f1, $f1

# creamos el bucle for
for:
# inicia en t0 y termina en t1

beq $t0,$t3,exit

addi $t0,$t0,1

# dividimos el interes entre 100 y lo guardamos en f3
div.s $f3,$f2, $f4

add.s $f8, $f3, $f11

mul.s $f1, $f1, $f8

# imprimimos el msg de res
li $v0, 4
la $a0, res
syscall

# imprimimos los anos
li $v0, 1
move $a0, $t0
syscall

# imprimimos el msg de res1
li $v0, 4
la $a0, res1
syscall

# imprimimos el resultado
li $v0,2
mov.s $f12,$f1
syscall

# imprimimos el salto de linea
li $v0, 4
la $a0, line
syscall

j for
syscall
exit:


li $v0, 10
syscall