section .data
    firstMsg db "Ingrese un numero: "
    lenf equ $ - firstMsg
    secondMsg db "La solucion es: "
    lens equ $ - secondMsg
    number dq 0
    solution dq 0

section .text
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
    mov rsi, number
    mov rdx, 1
    syscall

    mov rcx, [number]
    sub rcx, 30H

countLoop:
    xor rdx, rdx ;limpiando rdx
    mov rax, rcx ;rax -> 5
    mul rcx ;raz = rax * rcx (5*5) = 25
    add [solution], rax
    ;[solution] = (5*5) + (4*4) + ...
    dec rcx; 5 -> 4 3->0
    cmp rcx, 0
    jne countLoop ;0 = 0 ?

;SYS_WRITE
    mov rax, 1
    mov rdi, 1
    mov rsi, secondMsg
    mov rdx, lens
    syscall

test:
    xor rcx, rcx
    mov r8, 10
    mov rcx, [solution] ;55
    mov rbx, 0; cantidad de digitos
    xor rdx, rdx

division:
    mov rax, rcx; 5-> rax
    cmp rax, r8; 5<10
    jl aux

    div r8 ;rdx residuo rax cociente ; rax - 5 -- rdx - 5
    inc rbx ;1
    push rdx ;5

    mov rcx, rax ;rcx <- 5
    jmp division

aux:
    push rax; 5 -> 5
    inc rbx ; 2

loopprint:
    cmp rbx, 0 ;1
    je final
    dec rbx ;0
    pop rcx ; 5 -> rcx

    add rcx, 30H
    mov [solution], rcx
    
    mov rax, 1
    mov rdi, 1
    mov rsi, solution
    mov rdx, 1
    syscall ;5 5
    jmp loopprint

final:
;SYS_EXIT
    mov rax, 60
    mov rdi, 0
    syscall





    


