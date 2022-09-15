.data
    msg: .asciiz "\nIngrese su edad: "
    msg1: .asciiz "\nEres mayor de edad"
    msg2: .asciiz "\nEres menor de edad"
.text
main:
    # imprimimos el primer mensaje
    li $v0,4
    la $a0,msg
    syscall

    # recibimos el ingreso del usuario en $t1
    li $v0,5
    syscall
    move $t1,$v0

    # si t1 es menor que 18 en otro caso vamos al Else
    slt $t5, $t1, 18
    beq $t5, $0, Else
    
    # imprimimos que es menor 
    li $v0,4
    la $a0,msg2
    syscall
    
    # y terminamos el programa
    j Endif

    # imprimimos que es mayor
    Else:
        li $v0,4
        la $a0,msg1
        syscall
    Endif:

    li $v0,10
    syscall
