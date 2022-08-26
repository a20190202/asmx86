section .data
	mensaje db "Hola Mundo",0

section .bss
	inverse resb 20

section .text
	global _start

_start:

	mov rax, mensaje
	mov rbx,0

_countLoop:
	
	inc rax
	inc rbx
	mov cl, [rax]
	cmp cl,0
	jne _countLoop

	mov r8,rbx
	mov r9, inverse
	mov rax,mensaje
	add rax,r8

_reverse:

	dec rax
	mov r10,[rax]
	mov [r9],r10
	inc r9
	cmp rax, mensaje
	jne _reverse

	mov [r9], byte 10
	inc rbx

	mov rax,1
	mov rdi,1
	mov rsi, inverse
	mov rdx,rbx
	syscall

	mov rax,60
	mov rdi,0
	syscall


