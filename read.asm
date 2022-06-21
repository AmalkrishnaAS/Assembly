section .data
msg db 'enter two strs',10
len: equ $-msg

section .bss
n1: resb 5
n2: resb 5

section .text
global _start

_start:

    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,len
    int 80h

    mov ebx,0
    mov ecx,n1
    mov edx,5
    mov eax,3
    int 80h
    
    mov ebx,0
    mov ecx,n2
    mov edx,5
    mov eax,3
    int 80h

    mov eax,4
    mov ebx,1
    mov ecx,n1
    mov edx,5
    int 80h
    
    
    mov eax,4
    mov ebx,1
    mov ecx,n2
    mov edx,5
    int 80h


    mov eax, 1
    mov ebx, 0
    int 80h
    

