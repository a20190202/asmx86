section .data
    firstMsg db "Ingrese dos numeros: "
    lenf equ $ - firstMsg
    secondMsg db "La solucion es: "
    lens equ $ - secondMsg
    number1 dq 0
    char dq 0 ;char sirve para: numero espacio numero
    number2 dq 0
    negative dq 0

section .text ;Code Segment
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, firstMsg
    mov rdx, lenf
    syscall

    ;SYS_READ
    mov rax, 0
    mov rdi, 0
    mov rsi, number1
    mov rdx, 1
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, char
    mov rdx, 1
    syscall

    ;SYS_READ
    mov rax, 0
    mov rdi, 0
    mov rsi, number2
    mov rdx, 1
    syscall

    ;SYS_WRITE
    mov rax, 1
    mov rdi, 1
    mov rsi, secondMsg
    mov rdx, lens
    syscall
   
    mov rbx, [number1]; --3
    sub rbx, 30H
    mov rcx, [number2]; --4
    sub rcx, 30H
    mov rax, rcx ;4




etiqueta:
    neg rbx ;Hacemos al primer numero negativo -3 ;se trabajara con imul, neg
    imul rbx; rax -> -12
    mov [negative], rax

    mov qword [char], "-" ;se castea qword xq no se sabe su contenido 
    neg qword [negative] ;12 ;no se imprime los negativos defrente
    add qword [negative], 30H;12

; SYS_WRITE
    mov rax, 1
    mov rdi, 1
    mov rsi, char
    mov rdx, 1
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, negative
    mov rdx, 1
    syscall

final:
;SYS_EXIT
    mov rax, 60
    mov rdi, 0
    syscall


    
