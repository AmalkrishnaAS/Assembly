section .data
msg1: db "enter the size of the array", 10
l1: equ $-msg1
msg2: db "enter the elements of the array", 10
l2: equ $-msg2
msg3: db "sum in array", 10
l3: equ $-msg3
dot: db ".",
dotlen: equ $-dot
nwl: db 10



section .bss
digit1: resb 1
digit2: resb 1
array: resb 50 
element: resb 1
num: resb 1
sum: resb 1
temp: resb 1
ele: resb 1
junk resb 1
ans1: resb 1
ans2: resb 1
ans3: resb 1
ans4: resb 1
rem: resb 1



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
mov byte[sum],0
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
    ; cmp al,byte[sum]
    ; jng less
    add byte[sum],al



    ; less:
	pop ebx
	mov byte[ebx], al
	add ebx, 1

	dec byte[temp]
	cmp byte[temp], 0
	jg reading


; mov ebx,array
; movzx ecx,byte[num]
; mov al,byte[ebx]
; mov byte[sum],al

; searching:
;     push ecx

;     mov al,byte[ebx]
;     cmp al,byte[sum]
;     jnge less
;     mov byte[sum],al
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


mov ax, word[sum]
    ; mov bl, 1000
    ; div bl
    ; add al, 30h
    ; mov byte[ans1], al

    ;mov ax, dx

    mov bl, 100
    div bl
    mov bh, ah
    ;add al, 30h
    movzx ax, al
    mov bl, 10
    div bl
    add al, 30h
    add ah, 30h
    mov byte[ans1], al
    mov byte[ans2], ah

    movzx ax, bh
    mov bl, 10
    div bl,
    add al, 30h
    mov byte[ans3], al
    add ah, 30h
    mov byte[ans4], ah


mov eax,4
mov ebx,1
mov ecx,ans1
mov edx,1
int 80h


mov eax,4
mov ebx,1
mov ecx,ans2
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,ans3
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,ans4
mov edx,1
int 80h




mov ax,word[sum]
mov dl,byte[num]
div dl

mov byte[ele],al
mov byte[rem],ah

movzx ax,byte[ele]
mov bl,10
div bl

mov byte[digit1],al
mov byte[digit2],ah
add byte[digit1],30h
add byte[digit2],30h










mov eax,4
mov ebx,1
mov ecx,nwl
mov edx,1
int 80h


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
mov ecx,dot
mov edx,dotlen
int 80h


mov al,byte[rem]
mov ah,0
mov dl,10
mul dl

mov dl,byte[num]
div dl


mov byte[rem],al

add byte[rem],30h

mov eax,4
mov ebx,1
mov ecx,rem
mov edx,1
int 80h




; mov eax,4
; mov ebx,1
; mov ecx,rem
; mov edx,1
; int 80h










exit: 
    mov eax,1
    mov ebx,0
    int 80h