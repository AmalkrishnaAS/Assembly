section .data
msg1: db 'enter the string',10
l1: equ $-msg1
count: db 1


section .bss

str1: resb 50
temp: resb 1


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
inc edi
call count_words

mov al, byte[count]
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
cmp al, 10


je end_read


mov byte[ebx],al
inc ebx
jmp str_read

end_read:
inc ebx
mov byte[ebx],0
popad
ret

count_words:
pushad
loop:
cmp byte[esi],32
je next_check

next:
inc esi
inc edi
cmp byte[edi],0
je end_loop


jmp loop


next_check:
cmp byte[edi],32
jne inc_count
jmp next

inc_count:
inc byte[count]
jmp next

end_loop:
popad
ret



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
mov ecx,temp
call print_msg
popad
ret








