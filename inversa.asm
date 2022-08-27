section .data ;declaracion y definicionde data inicial
	mensaje db "Hola Mundo",0

section .bss ;declaracion y definicion de data sin b=valir inicial, tambien esapcios , ivnerse
	inverse resb 20

section .text
	global _start

_start:

	mov rax, mensaje
	mov rbx,0

_countLoop:
	
	inc rax
	inc rbx ;el contador de palabras
	mov cl, [rax] ;ve el contenido de la direccion
	cmp cl,0
	jne _countLoop ;compara si es diferente de 
    ;cuando acabe...
    ;rbx tiene el numero
    ;rax tiene la ultima posicion
	mov r8,rbx 
	mov r9, inverse
	mov rax,mensaje
	add rax,r8

_reverse:
    ;desde el 0 ira decayendo
	dec rax ;rax tiene mensaje + contador_palabrasa
	mov r10,[rax] ;primero, va a hacer pasa 'o' a r10
	mov [r9],r10; y luevo ese 'o' pasa a la posicion de inverse
	inc r9; inverse+1
	cmp rax, mensaje; hasta que rax no sea la misma direccion de mensaje, se iterara
	jne _reverse;si es diferente, itera
    ;cuando rax coincida con msj
    ;[] : para acceder dentro de la poiscion de memoria
	mov [r9], byte 10 ;salto de linea, enter
	inc rbx ;para que salga el enter
    ;inverse, rbx tiene el mensaje mas el enter

    ;impresion
	mov rax,1
	mov rdi,1
	mov rsi, inverse
	mov rdx,rbx
	syscall

    ;salir
	mov rax,60
	mov rdi,0
	syscall

;ensamblar:
;nasm -f elf64 inversa.asm -o inversa.o
;enlazar:
;ld inversa.o -o inversa
;correr el ejecutable:
;./inversa
