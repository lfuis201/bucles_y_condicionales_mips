.data 
    msg1: .asciiz "\nIntroduce una palabra: "
    msg2: .asciiz "\nIntroduce una letra: "
    string:      .space 100
.text
main:

    # imprimimos el msg1
    li $v0, 4
    la $a0, msg1
    syscall

    # leemos lo que escribe el usuario
    la $a0, string
    # cargaamos el tamaño del string
    li $a1, 100
    li $v0, 8
    syscall

    # leemos lo que escribe el usuario
    li $v0, 12
    syscall
    # asignamos s2 al caracter ingresado
    move $s2, $v0
    li $s1, 100

    # asignamos 0 a t4 y 0 a t0
    li  $t4, 0
    li  $t0, 0

    # si t0 es mayor al tamaño del strin vamos al print
    bge $t0, $s1, print

loop:
    # cargamos el primer caracter del string en $s0
    lb  $s0,($a0)
    # skip incrementa el contador si no es igual
    bne $s0, $s2, skip              
    add $t4, $t4, 1
skip:
    # incrementamos el index del string
    addi $a0, $a0, 1
    # vamos a imprimir si ya no hay caracters
    beq $s0,0,print
    j  loop

print:

    # asignamos el valor de t4 en a v0 y lo imprimimos
    addi $v0, $t4, 0
    li $v0,1             
    move $a0,$t4
    syscall  

    li $v0, 10
    syscall   


