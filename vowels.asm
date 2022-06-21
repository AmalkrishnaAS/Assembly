section .data
msg1: db 'Enter the string',10
l1: equ $-msg1
msg2: db 'number of as',10
l2: equ $-msg2
msg6: db 'number of es',10
l6: equ $-msg6
msg3: db 'number of is',10
l3: equ $-msg3
msg4: db 'number of os',10
l4: equ $-msg4
msg5: db 'number of us',10
l5: equ $-msg5
count_a: db 0 
count_e: db 0
count_i: db 0
count_o: db 0
count_u: db 0
nwl: db '',10


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
call count_vowels




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

mov byte[ebx],al
inc ebx
jmp str_read

end_read:
inc ebx
mov byte[ebx],0
popad
ret


count_vowels:
pushad
loop:

mov al,byte[ebx]
cmp al,0
je end_loop

cmp al,'a'
je inc_a
cmp al,'A'
je inc_a
cmp al,'e'
je inc_e
cmp al,'E'
je inc_e
cmp al,'i'
je inc_i
cmp al,'I'
je inc_i
cmp al,'o'
je inc_o
cmp al,'O'
je inc_o
cmp al,'u'
je inc_u
cmp al,'U'
je inc_u
next:
inc ebx
jmp loop

end_loop:
;printing stuff goes here....
mov ecx,msg2
mov edx,l2
call print_msg

mov al,byte[count_a]
mov ah,0
call print_num
call print_nwl

mov ecx,msg6
mov edx,l6
call print_msg


mov al,byte[count_e]
mov ah,0
call print_num
call print_nwl

mov ecx,msg3
mov edx,l3
call print_msg
mov al,byte[count_i]
mov ah,0
call print_num

call print_nwl

mov ecx,msg4
mov edx,l4
call print_msg
mov al,byte[count_o]
mov ah,0
call print_num

call print_nwl

mov ecx,msg5
mov edx,l5
call print_msg
mov al,byte[count_u]
mov ah,0
call print_num

call print_nwl

popad
ret





inc_a:
inc byte[count_a]
jmp next


inc_e:
inc byte[count_e]
jmp next



inc_i:
inc byte[count_i]
jmp next



inc_o:
inc byte[count_o]
jmp next



inc_u:
inc byte[count_u]
jmp next



print_num:
pushad
; number in ax
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
mov edx,1
call print_msg
popad
ret


print_nwl:
pushad
mov eax,4
mov ebx,1
mov ecx,nwl
mov edx,1
int 80h
popad
ret



