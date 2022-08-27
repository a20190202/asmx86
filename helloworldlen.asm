; Programa helloworldlen.asm
; Para ensamblar ejecutar:
; nasm -f elf64 helloworldlen.asm -o helloworldlen.o
; Para enlazar ejecutar:
; ld helloworldlen.o -o helloworldlen
; Para correr el ejecutable:
; ./helloworldlen

; SEGMENTO DE DATOS
; Se empleara la etiqueta message y se reservaran elementos de 8 bits
; Cada letra de la cadena se corresponde con un elemento de 8 bits
; El numero 10 se corresponde con el caracter \n
; El numero 0 se emplea como fin de cadena
section .data
	message db "Hello World",10,0

; SEGMENTO DE TEXTO
section .text
	global _start

; rax apunta al principio de la cadena
; rbx se empleara como contador
; nos desplazamos a lo largo de la cadena hasta encontrar un cero
; cuando rax vale cero dejamos de iterar
; en rbx se encuentra la longitud de la cadena
_start:
	mov	rax, message
	mov	rbx, 0

_countLoop:
	inc	rax
	inc	rbx
	mov	cl, [rax]
	cmp	cl, 0
	jne	_countLoop

; SYS_WRITE
	mov 	rax, 1
	mov 	rdi, 1
	mov 	rsi, message
	mov	rdx, rbx
	syscall

; SYS_EXIT
	mov	rax, 60
	mov	rdi, 0
	syscall
