section .data
msg1: db 'Enter the string',10
l1:equ $-msg1
count: db 0
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
mov ebx,str1
call count_space



mov al,byte[count]
mov ah,0
call print_num

exit:
mov eax,1
mov ebx,0
int 80h


print_num:
pusha
mov bl ,10
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
popa
ret











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

;put base addr in ebx
count_space:
pusha
loop:
mov al,byte[ebx]
cmp al,0
je end_loop
cmp al,32
jne next
inc byte[count]
next:
inc ebx
jmp loop
end_loop:
popa
ret

;put two digit in ax then call 

print_msg:
pusha
mov eax,4
mov ebx,1
int 80h
popa
ret






