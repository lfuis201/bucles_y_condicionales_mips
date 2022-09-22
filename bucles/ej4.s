
.data
    msg: .asciiz "Ingrese un numero: "
    spa: .asciiz ", "

.text
main:

    # imprimimos el msg
    li  $v0,4
    la  $a0, msg
    syscall 

    # input del usuario en t0
    li $v0,5
    syscall
    move $t0, $v0

    li  $t1, 1

# Show Output
loop: 
# decrementamos t0 en 1

sub $t2, $t0, $t1

# imprimimos el t2
li $v0, 1
move $a0, $t2
syscall


move    $t0, $t2    
bgt $a0, 0, loop

li  $v0,10      # load the "exit" number into register $v0
syscall 