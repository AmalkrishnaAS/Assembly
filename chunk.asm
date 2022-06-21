section .data
msg1: db 'enter the string',10
l1: equ $-msg1
count: db 1
max: db 1


section .bss

str1:resb 50
temp: resb 1

section .text
global _start
_start:

mov ecx,msg1
mov edx,l1
call print_msg


mov ebx,str1
call read_str


mov esi,str1 ;trailing
mov edi,str1 ;leading

call find_max

mov al,byte[max]
mov ah,0
call print_num

exit:
mov eax,1
mov ebx,0
int 80h


print_msg:
pushad
mov eax,4
mov ebx,1
int 80h
popad
ret

read_str:
pushad
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
inc ebx
mov byte[ebx],al
jmp str_read
end_read:
inc ebx
mov byte[ebx],0


popad
ret


find_max:
pushad
inc edi


loop:
mov al,byte[edi]
mov bl,byte[esi]
cmp al, bl
jne no_update

inc byte[count]

no_update:
mov cl,byte[count]
mov dl,byte[max]
cmp cl,dl
jng no_change

mov byte[max],cl

no_change:
inc edi
mov al,byte[edi]
mov bl,byte[esi]
cmp al,bl
je no_reset

mov byte[count],1

no_reset:
inc esi

cmp byte[edi],0
je end_loop

jmp loop
end_loop:
popad
ret

; no in ax
print_num:
pushad

mov bl,10
div bl
add al,30h
add ah,30h

mov byte[temp],al
mov ecx,temp
mov edx,1
call print_msg

mov byte[temp],ah
mov edx,1
mov ecx,temp
call print_msg
popad
ret






