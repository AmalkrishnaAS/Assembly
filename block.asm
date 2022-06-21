section .data
msg1: db 'Enter the string',10
l1:equ $-msg1
count: db 1
max: db 1


section .bss
str1: resb 50
temp: resb 1
d1: resb 1
d2: resb 1


section .text
global _start
_start:

mov ecx,msg1
mov edx,l1
call print_msg

mov ebx,str1
call read_str
mov esi,str1
mov edi,str1
call find_max

mov al,byte[max]
mov ah,0
mov bl,10
div bl


add al,30h
add ah,30h
mov byte[d1],al
mov byte[d2],ah


mov ecx,d1
mov edx,1
call print_msg
mov ecx,d2
mov edx,1
call print_msg






exit:
mov eax,1
mov ebx,0
int 80h


;msg in ecx and length in edx already

print_msg:
pusha
mov eax,4
mov ebx,1
int 80h
popa
ret


; base address in ebx
read_str:
pusha
str_read:
push ebx
mov eax,3
mov ebx,0
mov ecx,temp
mov edx,1
int 80h

mov al,byte[temp]
cmp al,10
je end_read
pop ebx
mov byte[ebx],al
inc ebx
jmp str_read
end_read:
pop ebx
inc ebx
mov byte[ebx],0
popa
ret
;string in esi and edi
find_max:
pusha
inc edi

loop:
mov bl,byte[esi]
mov cl,byte[edi]
cmp bl,cl
jne next
inc byte[count]
next:
cmp byte[edi],0
je end_loop
mov al,byte[count]
mov dl,byte[max]
cmp al,dl
jng no_update
mov byte[max],al
no_update:

inc edi
mov al,byte[edi]
mov bl,byte[esi]
cmp al,bl
je end
mov byte[count],1

end:
inc esi
jmp loop
end_loop:
popa 
ret













