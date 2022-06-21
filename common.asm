section .data
msg1: db "enter size of array: ", 10
l1: equ $-msg1
msg2: db "enter array elements: ", 10
l2: equ $-msg2
nwl:db 10


section .bss
num: resb 1
size2: resb 1
array1: resb 50
array2: resb 50
digit1: resb 1
digit2: resb 1
temp: resb 1
ele: resb 1
i: resb 1
j: resb 1


section .text
	global _start
	_start:
	;Printing the message to enter the number
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, l1
	int 80h
	;Reading the number
	mov eax, 3
	mov ebx, 0
	mov ecx, digit1
	mov edx, 1
	int 80h
	mov eax, 3
	mov ebx, 0
	mov ecx, digit2
	mov edx, 2
	int 80h
	; mov eax, 3
	; mov ebx, 0
	; mov ecx, temp
	; mov edx, 1
	; int 80h

	sub byte[digit1], 30h
	sub byte[digit2], 30h
	mov al, byte[digit1]
	mov dl, 10
	mul dl
	mov byte[num], al
	mov al, byte[digit2]
	add byte[num], al
	mov cl, byte[num]

	mov byte[temp], al
	mov ebx, array1
	reading:
    push ecx
	push ebx ;Preserving The value of ebx in stack
	;Printing the message to enter each element
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, l2
	int 80h
	;Reading the number
	mov eax, 3
	mov ebx, 0
	mov ecx, digit1
	mov edx, 1
	int 80h
	mov eax, 3
	mov ebx, 0
	mov ecx, digit2
	mov edx, 2
	int 80h
	sub byte[digit1], 30h
	sub byte[digit2], 30h
	mov al, byte[digit1]
	mov dl, 10
	mul dl
	add al, byte[digit2]
	;al now contains the number

	pop ebx

	mov byte[ebx], al
	add ebx, 1

    pop ecx
	dec cl
	cmp cl, 0
	jg reading


    mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, l1
	int 80h
	;Reading the number
	mov eax, 3
	mov ebx, 0
	mov ecx, digit1
	mov edx, 1
	int 80h
	mov eax, 3
	mov ebx, 0
	mov ecx, digit2
	mov edx, 2
	int 80h
	; mov eax, 3
	; mov ebx, 0
	; mov ecx, temp
	; mov edx, 1
	; int 80h

	sub byte[digit1], 30h
	sub byte[digit2], 30h
	mov al, byte[digit1]
	mov dl, 10
	mul dl
	mov byte[size2], al
	mov al, byte[digit2]
	add byte[size2], al
	mov cl, byte[size2]

	mov byte[temp], al
	mov ebx, array2
	reading1:
    push ecx
	push ebx ;Preserving The value of ebx in stack
	;Printing the message to enter each element
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, l2
	int 80h
	;Reading the number
	mov eax, 3
	mov ebx, 0
	mov ecx, digit1
	mov edx, 1
	int 80h
	mov eax, 3
	mov ebx, 0
	mov ecx, digit2
	mov edx, 2
	int 80h
	sub byte[digit1], 30h
	sub byte[digit2], 30h
	mov al, byte[digit1]
	mov dl, 10
	mul dl
	add al, byte[digit2]
	;al now contains the number

	pop ebx

	mov byte[ebx], al
	add ebx, 1

    pop ecx
	dec cl
	cmp cl, 0
	jg reading1

find_common:
    mov ebx, array1
    mov dl, byte[num]
    mov byte[i], dl
    loop_i:
        mov ecx, array2
        mov dl, byte[size2]
        mov byte[j], dl
        loop_j:
            mov dl, byte[ebx]
            cmp dl, byte[ecx]
            jne next_check

            mov byte[ele], dl
             movzx ax,byte[ele]
mov bl,10
div bl

mov byte[digit1],al
mov byte[digit2],ah
add byte[digit1],30h
add byte[digit2],30h


mov eax,4
mov ebx,1
mov ecx,digit1
mov edx,1
int 80h


mov eax,4
mov ebx,1
mov ecx,digit2
mov edx,1
int 80h


mov eax,4
mov ebx,1
mov ecx,nwl
mov edx,1
int 80h





            next_check:
            add ecx, 1
            dec byte[j]
            jnz loop_j
        add ebx, 1
        dec byte[i]
        jnz loop_i









    mov eax, 1
    mov ebx, 0
    int 80h

