section .data
msg db 'enter a number',10
sapce db "" ,10
len: equ $-msg

section .bss
n1: resb 5
counter : resb 1


section .text
global _start

_start:

    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,len
    int 80h

    mov ebx,0
    mov ecx,n1
    mov edx,5
    mov eax,3
    int 80h

    sub byte[n1], 30h
	mov byte[counter], 0

    for:
    


		add byte[counter], 30h
		mov eax, 4
		mov ebx, 1
		mov ecx, counter
		mov edx, 1
		int 80h
         
		
		sub byte[counter], 30h
		add byte[counter], 1
		mov al, byte[counter]
		cmp al, byte[n1]
        mov eax,4
		jna for


        mov eax, 1
	    mov ebx, 0
	    int 80h
