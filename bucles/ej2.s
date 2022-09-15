.data
    msg: .asciiz "\nIngrese la contrasena: "
    pass: .asciiz "contrasena"
    correcto: .asciiz "\nLa contrasena coincide "
    incorrecto: .asciiz "\nLa contrasena no coincide "
    input: .space 20
.text
main:
    # imprimimos el primer mensaje
    li $v0,4
    la $a0,msg
    syscall

    # recibimos el ingreso del usuario
    li $v0, 8
    la $a0, input
    li $a1, 21
    syscall

    # recibimos el ingreso del usuario en $t1
    la $t1, input
    # recibimos el ingreso del usuario en $t1
    la $t2, pass

    # si t1 es menor que 18 en otro caso vamos al Else
    beq $t1, $t2, Else
    
    # imprimimos que es menor 
    li $v0,4
    la $a0,correcto
    syscall
    
    # y terminamos el programa
    b Endif

    # imprimimos que es mayor
    Else:
        li $v0,4
        la $a0,incorrecto
        syscall
    Endif:

    li $v0,10
    syscall
