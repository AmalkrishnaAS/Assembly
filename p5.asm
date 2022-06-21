section .data
msg: db "enter an even number",10
l: equ $-msg
count: db -1
lc: equ $-count


section .bss
d1: resb 1
d2: resb 1
num:resb 2
rem: resb 2
quot: resb 1
ans: resb 2


section .text
global _start
_start:

mov eax ,4
mov ebx ,1
mov ecx ,msg
mov edx ,l
int 0x80


mov eax ,3
mov ebx ,0
mov ecx ,d1
mov edx ,1
int 80h

mov eax ,3
mov ebx ,0
mov ecx ,d2
mov edx ,1
int 80h


sub byte[d1],30h
sub byte[d2],30h

mov al ,byte[d1]
mov ah,0
mov bx,10
mul bl

add ax,[d2]
mov [num],ax


for: 
mov ax,word[num]
mov bl,2
div bl

mov [num],al
mov [rem],ah

inc byte[count]

cmp byte[rem],0
je for

add byte[count],30h

mov eax ,4
mov ebx ,1
mov ecx ,count
mov edx , lc
int 0x80


mov eax,1
mov ebx,0
int 80h




