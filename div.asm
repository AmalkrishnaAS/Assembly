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
count:resb 1

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


mov byte[count],0


for:

mov ax,word[limit]
mov bl,2
div bl
mov [limit],al
cmp ah,0
jne exit
inc byte[count]

jmp for
exit:
add byte[count],30h


mov eax,4
mov ebx,1
mov ecx,count
mov edx,1
int 80h

mov eax,1
mov ebx,0
int 80h


