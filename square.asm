section .data
msg : db "enter the number",10
m1: equ $-msg


section .bss
d1: resb 1
d2: resb 1
ans1: resb 1
ans2: resb 1
ans3: resb 1
ans4: resb 1
sum: resb 2
num: resb 2
junk: resb 1


section .text
global _start
_start:


;displaying the message
mov eax,4
mov ebx,1
mov ecx,msg
mov edx,m1
int 80h


;asking for the first digit
mov eax,3
mov ebx,0
mov ecx,d1
mov edx,1
int 80h


;asking for the second digit
mov eax,3
mov ebx,0
mov ecx,d2
mov edx,1
int 80h


;get junk
mov eax,3
mov ebx,0
mov ecx,junk
mov edx,1
int 80h

;convert to int

sub byte[d1],30h
sub byte[d2],30h


;constructing the number
mov al,[d1]
mov ah,0
mov bl,10
mul bl

mov [num],ax

add ax,word[d2]
mov [num],ax


mov al,byte[num]
mov ah,0
mov bl,byte[num]
mul bl


mov [sum],ax

mov ax,word[sum]


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


mov eax,1
mov ebx,0
int 80h




