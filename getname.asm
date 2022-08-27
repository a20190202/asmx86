; Programa getname.asm
; Para ensamblar ejecutar:
; nasm -f elf64 getname.asm -o getname.o
; Para enlazar ejecutar:
; ld getname.o -o getname
; Para correr el ejecutable:
; ./getname

; SEGMENTO DE DATOS
section .data
	question db "What is your name? "
	lenq equ $ - question
	greet db "Hello, "
	leng equ $ - greet

; SEGMENTO BSS (Block Started by Symbol)
; Reservamos 16 bytes para el nombre que sera ingresado 
section .bss
	name resb 16

; SEGMENTO DE TEXTO
section .text
	global _start

; SYS_WRITE
_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, question
	mov rdx, lenq
	syscall

; SYS_READ
	mov rax, 0
	mov rdi, 0
	mov rsi, name
	mov rdx, 16
	syscall

; SYS_WRITE
	mov rax, 1
	mov rdi, 1
	mov rsi, greet
	mov rdx, leng
	syscall

; SYS_WRITE
	mov rax, 1
	mov rdi, 1
	mov rsi, name
	mov rdx, 16
	syscall

; SYS_EXIT
	mov rax, 60
	mov rdi, 0
	syscall
