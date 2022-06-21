section .data
msg: db 'enter the string',10
l: equ $-msg
count: db 0
max: db 0
section .bss
str: resb 50
temp: resb 1
d1: resb 1
d2: resb 1
address: resd 1
section .text
global _start
_start:

mov eax,4
mov ebx,1
mov ecx,msg
mov edx,l
int 80h

mov ebx,str
call read_str


call find_max
mov al,byte[max]
mov ah,0
mov cl,10
div cl

add al,30h
add ah,30h
mov byte[d1],al
mov byte[d2],ah

;mov eax,4
;mov ebx,1
;mov ecx,d1
;mov edx,1
;int 80h


;mov eax,4
;mov ebx,1
;mov ecx,d2
;mov edx,1
;int 80h
iterate:
cmp byte[max],0
je exit
mov eax,4
mov ebx,1
mov ecx,dword[address]
mov edx,1
int 80h
inc dword[address]
dec byte[max]
jmp iterate




exit:
mov eax,1
mov ebx,0
int 80h


read_str:
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

find_max:
pusha
loop:
mov al,byte[ebx]
cmp al,32
jne if
mov byte[count],0
jmp next
if:
inc byte[count]
next:
mov dl,byte[count]
cmp dl,byte[max]
jng no_update
mov byte[max],dl
mov dword[address],ebx
sub byte[address],dl
inc dword[address]

no_update:
inc ebx
cmp byte[ebx],0
je end_loop
jmp loop
end_loop:
popa
ret




