section .data
msg: db "enter limit",10
m1: equ $-msg


section .bss
limit: resb 1
sum: resb 2
d1: resb 2
d2: resb 2
junk:resb 1
ans1: resb 2
ans2: resb 2
ans3: resb 2
ans4: resb 2


; display the msg
section .text
global _start
_start:
mov eax,4
mov ebx,1
mov ecx,msg
mov edx,m1
int 80h

;get the first digit of the limit
mov eax,3
mov ebx,0
mov ecx,d1
mov edx,1
int 80h

sub byte[d1],30h


;get the second digit of the limit
mov eax,3
mov ebx,0
mov ecx,d2
mov edx,1
int 80h


sub byte[d2],30h

;get junk 
mov eax,3
mov ebx,0
mov ecx,junk
mov edx,1
int 80h


;construct the limit

mov al,[d1]
mov ah,0
mov bl,10
mul bl

mov [limit],ax

add ax,word[d2]
mov [limit],ax


;DIVIDE N/2    (formula derived using arithemetic progression)   m= n/2    m(m+1)=sum

shr byte[limit],1

mov al,byte[limit]
mov ah,0

add byte[limit],1

mov bl,byte[limit]

mul bl

mov [sum],ax
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


mov eax,1
mov ebx,0
int 80h






