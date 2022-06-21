section .data

prompt: db "enter first number",10
l: equ $-prompt
prompt1: db "enter second number",10
l1: equ $-prompt1
ans0:db "no",10
a0: equ $-ans0
ans1:db "yes",10
a1: equ $-ans1



section .bss
d01:resb 1
d02:resb 1
d11:resb 1
d12:resb 1
num1:resb 2
num2:resb 2
junk: resb 1
rem :resb 1


section .text
global _start
_start:

mov eax,4
mov ebx,1
mov ecx,prompt
mov edx,l
int 80h


mov eax,3
mov ebx,0
mov ecx,d01
mov edx,1
int 80h

sub byte[d01],30h

mov eax,3
mov ebx,0
mov ecx,d02
mov edx,1
int 80h

sub byte[d02],30h

mov al,byte[d01]
mov ah,0
mov bl,10
mul bl

add ax,word[d02]

mov [num1],ax


mov eax,3
mov ebx,0
mov ecx,junk
mov edx,1
int 80h



mov eax,4
mov ebx,1
mov ecx,prompt1
mov edx,l1
int 80h


mov eax,3
mov ebx,0
mov ecx,d11
mov edx,1
int 80h

sub byte[d11],30h


mov eax,3
mov ebx,0
mov ecx,d12
mov edx,1
int 80h

mov eax,3
mov ebx,0
mov ecx,junk
mov edx,1
int 80h

sub byte[d12],30h

mov al,byte[d11]
mov ah,0
mov bl,10
mul bl

add ax,word[d12]

mov [num2],ax

mov al,byte[num1]
mov ah,0
mov bl,byte[num2]
div bl



mov [rem],ah
cmp byte[rem],0
jne else

mov eax,4
mov ebx,1
mov ecx,ans1
mov edx,a1
int 80h
jmp exit

    
else:
mov eax,4
mov ebx,1
mov ecx,ans0
mov edx,a0
int 80h







exit:
mov eax,1
mov ebx,0
int 0x80
