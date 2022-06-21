section .bss
	digit0: resb 1
	digit1: resb 1
	array: resb 50 ;Array to store 50 elements of 1 byte each.
	element: resb 1
	num: resb 1
	pos: resb 1
	temp: resb 1
	ele: resb 1
	ans1:resb 1
	ans2:resb 1
	ans3: resb 1
	ans4: resb 1

section .data
	msg1: db "Enter the number of elements : "
	size1: equ $-msg1
	msg2: db "Enter a number:"
	size2: equ $-msg2
	;msg3: db "Enter the number to be searched : "
	;size3: equ $-msg3
	;msg_found: db "Element found at position : "
	;size_found: equ $-msg_found
	msg_not: db "Odd"
	size_not: equ $-msg_not
        msg: db "Even"
        size: equ $-msg
section .text
	global _start
	_start:
	;Printing the message to enter the number
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, size1
	int 80h
	;Reading the number
	mov eax, 3
	mov ebx, 0
	mov ecx, digit1
	mov edx, 1
	int 80h
	mov eax, 3
	mov ebx, 0
	mov ecx, digit0
	mov edx, 1
	int 80h
	mov eax, 3
	mov ebx, 0
	mov ecx, temp
	mov edx, 1
	int 80h

	sub byte[digit1], 30h
	sub byte[digit0], 30h
	mov al, byte[digit1]
	mov dl, 10
	mul dl
	mov byte[num], al
	mov al, byte[digit0]
	add byte[num], al
	mov al, byte[num]
	
	mov byte[temp], al
	mov ebx, array
	reading:
	push ebx ;Preserving The value of ebx in stack
	;Printing the message to enter each element
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, size2
	int 80h
	;Reading the number
	mov eax, 3
	mov ebx, 0
	mov ecx, digit1
	mov edx, 1
	int 80h
	mov eax, 3
	mov ebx, 0
	mov ecx, digit0
	mov edx, 2
	int 80h
	
	sub byte[digit1], 30h
	sub byte[digit0], 30h
	mov al, byte[digit1]
	mov dl, 10
	mul dl
	add al, byte[digit0]
	;al now contains the number

	pop ebx
	mov byte[ebx], al
	add ebx, 1

	dec byte[temp]
	cmp byte[temp], 0
	jg reading
	
	mov al, byte[num]
	mov byte[temp], al
	movzx ecx, byte[num]
	mov ebx, array
	
	
	mov byte[ans1], 0
	mov byte[ans2], 0
	
	if:
	add byte[ans1], 1
	add ebx, 1
	sub byte[temp], 1
	cmp byte[temp], 0
	ja oddeven
	
	oddeven:
	
	mov al, byte[ebx]
	mov ah, 0
	mov bl, 2
	div bl
	cmp ah, 0
	je if
	add ebx, 1
	sub byte[temp], 1
	cmp byte[temp], 0
	ja oddeven
	

        ;sub byte[ans1], 1
        mov bl, byte[num]
        sub bl, byte[ans1]
        mov byte[ans2], bl
        
	add byte[ans1], 30h
	add byte[ans2], 30h
	mov eax, 4
	mov ebx, 1
	mov ecx, msg_not
	mov edx, size_not
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, ans2
	mov edx, 1
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, size
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, ans1
	mov edx, 1
	int 80h
	
	mov eax, 1
	mov ebx, 0
	int 80h