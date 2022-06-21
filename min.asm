section .data
	msg1: db "Enter the number of elements : "
	size1: equ $-msg1
	msg2: db "Enter a number:"
	size2: equ $-msg2
    msg3: db "Sum of elements is : "
    size3: equ $-msg3
    msg4: db "Average of elements is : "
    size4: equ $-msg4



    section .bss
    array: resb 50
    num: resb 1
    size: resb 1
    digit1: resb 1
    digit2: resb 1
    sum: resb 1
    avg: resb 1
    junk: resb 1
    temp: resb 1




    section .text
    global _start
_start:

;print 
mov eax,4
mov ebx,1
mov ecx,msg1
mov edx,size1
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
mov ah,0
mov bl,10
mul bl


mov byte[num],al
mov al,byte[digit2]
add byte[num],al


mov ebx,array
mov byte[temp],al
 
read:
push ebx


mov eax,4
mov ebx,1
mov ecx,msg2
mov edx,size2
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

mov al,byte[digit1]
mov ah,0
mov bl,10
mul bl


add al,byte[digit2]

pop ebx

mov byte[ebx],al
add ebx,1
dec byte[temp]
cmp byte[temp],0
jg read


movzx ecx, byte[num]
	mov ebx, array
	mov byte[sum],0

	searching:

	mov al , byte[ebx]
	add byte[sum],al
	add ebx, 1
	loop searching

mov al,byte[sum]
mov ah,0
mov bl,10
div bl

mov [digit1],al
mov [digit2],ah


add byte[digit1],30h
add byte[digit2],30h


mov eax,4
mov ebx,1
mov ecx,msg3
mov edx,size3
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




end:
mov eax,1
mov ebx,0
int 80h






