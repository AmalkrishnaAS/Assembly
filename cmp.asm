section .data
msg1: db 'Enter the first string',10
l1:equ $-msg1
msg2: db 'Enter second String',10
l2:equ $-msg2
msg3: db 'Yes',10
l3:equ $-msg3
msg4: db 'No',10
l4:equ $-msg4



section .bss
str1: resb 50
str2:resb 50
strlen: resb 1
temp: resb 1

section .text
global _start
_start:
mov eax,4
mov ebx,1
mov ecx,msg1
mov edx,l1
int 80h

mov ebx,str1
call read_string
mov eax,4
mov ebx,1
mov ecx,msg1
mov edx,l1
int 80h

mov ebx,str2
call read_string


mov esi,str1
mov edi,str2
call compare





exit:
mov eax,1
mov ebx,0
int 80h


read_string:
pusha
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
inc ebx
jmp str_read

end_read:
inc ebx
mov byte[ebx],0
popa
ret
;str1 and str2 in esi and edi
compare:
pusha
cmp_str:
cmp byte[edi],0
je pos
cmp byte[esi],0
je pos
mov eax,dword[esi]
mov ebx,dword[edi]
cmp eax,ebx
jne neg
inc esi
inc edi
jmp cmp_str
neg:

mov eax,4
mov ebx,1
mov ecx,msg4
mov edx,l4
int 80h
jmp exit_func


pos:

mov eax,4
mov ebx,1
mov ecx,msg3
mov edx,l3
int 80h

exit_func:
popa
ret



