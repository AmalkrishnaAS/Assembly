section .data
msg1: db "enetr the size of the array", 10
l1: equ $-msg1
msg2: db "enter the elements of the array", 10
l2: equ $-msg2
msg3: db "Even:", 10
l3: equ $-msg3
msg4: db "Odd:", 10
l4: equ $-msg4
nwl: db 10



section .bss
array: resb 50
even: resb 1
odd: resb 1
digit1: resb 1
digit2: resb 1
temp: resb 1
num: resb 1
max: resb 1

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
mov edx,2
int 80h


sub byte[digit1],30h
sub byte[digit2],30h


mov al,byte[digit1]
mov dl,10
mul dl
add al,byte[digit2]
mov byte[num],al
mov cl,byte[num]


mov byte[temp],al


mov ebx,array
mov byte[even],0
mov byte[odd],0

read:
    push ecx
    push ebx
    mov eax,4
    mov ebx,1
    mov ecx,msg2
    mov edx,l2
    int 80h

    mov eax,3
    mov ebx,0
    mov ecx,digit1
    mov edx,1
    int 80h

    mov eax,3
    mov ebx,0
    mov ecx,digit2
    mov edx,2
    int 80h

    sub byte[digit1],30h
    sub byte[digit2],30h


    mov al,byte[digit1]
    mov dl,10
    mul dl
    add al,byte[digit2]
    ;al now contains the the number
    ; mov dl,2
    ; div dl
    ; cmp ah,0
    ; jne odd_
    ; inc byte[even]
    ; jmp continue
    ; odd_:
    ; inc byte[odd]
    ; continue:



    pop ebx
    mov byte[ebx],al
    add ebx,1
    pop ecx
    dec cl
    cmp cl,0
    jne read


    movzx ecx,byte[num]
mov ebx,array
mov byte[even],0
mov byte[odd],0
mov byte[max],-99



searching:
    push ecx

    mov al,byte[ebx]
    cmp al,byte[max]
    jng skip
    mov byte[max],al
    skip:
    add ebx,1
    pop ecx
    ; add byte[pos],1
    loop searching


    movzx ax,byte[max]
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



; movzx ax,byte[odd]
; mov bl,10
; div bl

; mov byte[digit1],al
; mov byte[digit2],ah
; add byte[digit1],30h
; add byte[digit2],30h


; mov eax,4
; mov ebx,1
; mov ecx,digit1
; mov edx,1
; int 80h


; mov eax,4
; mov ebx,1
; mov ecx,digit2
; mov edx,1
; int 80h






    mov eax,1
    mov ebx,0
    int 80h
    




