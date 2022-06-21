section .data
msg1: db 'enter string',10
l1: equ $-msg1

section .bss
str: resb 50
strlen: resb 1
temp: resb 1
last :resb 1

section .text

global _start
_start:
mov byte[strlen],0
mov eax,4
mov ebx,1
mov ecx,msg1
mov edx,l1
int 80h

mov ebx,str

str_read:
push ebx
mov eax,3
mov ebx,0
mov ecx,temp
mov edx,1
int 80h
pop ebx
mov al,byte[temp]
cmp al,10
je end_read

mov byte[ebx],al
mov dword[last],ebx
inc ebx
inc byte[strlen]
jmp str_read

end_read:
inc ebx
inc byte[strlen]
mov byte[ebx],0

mov ebx,str
mov ecx,dword[last]

print_rev:
push ebx
mov eax,4
mov ebx,1
mov edx,1
int 80h
pop ebx
cmp ebx,ecx
je print_end
dec ecx
jmp print_rev

print_end:
; mov eax,4
; mov ebx,1
; mov edx,1
; int 80h






mov eax,1
mov ebx,0
int 80h







