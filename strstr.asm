section .data
msg1: db 'enter the string',10
l1: equ $-msg1
ans1: db 'yes',10
a1: equ $-ans1
ans2: db'no',10
a2: equ $-ans2


section .bss


str1:resb 50
str2: resb 50
temp: resb 1


section .text

global _start
_start:

mov ecx,msg1
mov edx,l1
call print_msg


mov ebx,str1
call read_str

call print_msg
mov ebx,str2
call read_str


mov esi,str1
mov edi,str2
call compare
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



compare:
pushad

;strings in esi and edi
loop:

cmp dword[esi],0
je pos

cmp dword[edi],0
je pos




mov eax,dword[esi]
mov ebx,dword[edi]
cmp eax,ebx
jne neg

inc esi
inc edi

jmp loop



pos:
mov ecx,ans1
mov edx,a1
call print_msg
jmp return

neg:
mov ecx,ans2
mov edx,a2
call print_msg
jmp return 


return:
popad
ret




