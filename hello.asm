section .data

msg db "amal",10
l1: equ $-msg
msg2 db "b200729cs",10
 l2: equ $-msg2

section .text
global _start

_start:
    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,l1
    int 80h

    mov eax,4
    mov ebx,1
    mov ecx,msg2
    mov edx,l2
    int 80h
    
    mov eax, 1
    mov ebx, 0
    int 80h
    

