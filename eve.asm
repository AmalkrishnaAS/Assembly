section .data
msg1: db "enter the size of the array", 10
l1: equ $-msg1
msg2: db "enter the elements of the array", 10
l2: equ $-msg2
msg3: db "max in array", 10
l3: equ $-msg3
nwl: db 10


section .bss
digit1: resb 1
digit2: resb 1
array: resb 50 
element: resb 1
num: resb 1
max: resb 1
temp: resb 1
ele: resb 1
junk resb 1
counteven: resb 1
countodd: resb 1


section .text
global _start
_start:

mov eax,4
mov ebx,1
mov ecx,msg1
mov edx,l1
int 80h




mov eax,3
mov ebx,0
mov ecx,digit1
mov edx,1
int 80h



mov eax,3
mov ebx,0
mov ecx,digit2
mov edx,1
int 80h




mov eax,3
mov ebx,0
mov ecx,junk
mov edx,1
int 80h


sub byte[digit1],30h
sub byte[digit2],30h

mov al,byte[digit1]
mov dl,10
mul dl

mov byte[num],al
mov al,byte[digit2]
add byte[num],al
mov al,byte[num]


mov byte[temp],al
mov ebx,array
mov byte[counteven],0
mov byte[countodd],0
reading:
	push ebx 
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
     mov dl,2
    div dl
    cmp ah,0
    jne odd
    inc byte[counteven]
    jmp continued

    odd: 
    inc byte[countodd]


    continued:

	add ebx, 1

	dec byte[temp]
	cmp byte[temp], 0
	jg reading


; mov ebx,array
; movzx ecx,byte[num]
; mov al,byte[ebx]
; mov byte[max],al

; searching:
;     push ecx

;     mov al,byte[ebx]
;     cmp al,byte[max]
;     jnge less
;     mov byte[max],al
;     less:
;     add ebx,1
;     pop ecx
;     ; add byte[pos],1
;     loop searching


mov eax,4
mov ebx,1
mov ecx,msg3
mov edx,l3
int 80h


movzx ax,byte[counteven]
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



movzx ax,byte[countodd]
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



















exit: 
    mov eax,1
    mov ebx,0
    int 80h