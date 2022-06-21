section .data
msg1: db "enetr the size of the array", 10
l1: equ $-msg1
msg2: db "enter the elements of the array", 10
l2: equ $-msg2
msg3: db "Even:", 10
l3: equ $-msg3
msg4: db "Odd:", 10
l4: equ $-msg4
nwl: db 10
count: db 2



section .bss
array: resb 50
even: resb 1
odd: resb 1
digit1: resb 1
digit2: resb 1
temp: resb 1
num: resb 1
max: resb 1
sum: resb 1
ans1: resb 1
ans2: resb 1
ans3: resb 1
ans4: resb 1
ele: resb 1



section .text
global _start
_start:


mov eax,4
mov ebx,1
mov ecx,msg1
mov edx,l1
int 80h

mov eax,3
mov ebx,0
mov ecx,digit1
mov edx,1
int 80h


mov eax,3
mov ebx,0
mov ecx,digit2
mov edx,2
int 80h


sub byte[digit1],30h
sub byte[digit2],30h


mov al,byte[digit1]
mov dl,10
mul dl
add al,byte[digit2]
mov byte[num],al
mov cl,byte[num]


mov byte[temp],al


mov ebx,array
mov byte[even],0
mov byte[odd],0

read:
    push ecx
    push ebx
    mov eax,4
    mov ebx,1
    mov ecx,msg2
    mov edx,l2
    int 80h

    mov eax,3
    mov ebx,0
    mov ecx,digit1
    mov edx,1
    int 80h

    mov eax,3
    mov ebx,0
    mov ecx,digit2
    mov edx,2
    int 80h

    sub byte[digit1],30h
    sub byte[digit2],30h


    mov al,byte[digit1]
    mov dl,10
    mul dl
    add al,byte[digit2]
    ;al now contains the the number

    
    ; mov dl,2
    ; div dl
    ; cmp ah,0
    ; jne odd_
    ; inc byte[even]
    ; jmp continue
    ; odd_:
    ; inc byte[odd]
    ; continue:

    



    pop ebx
    mov byte[ebx],al
    add ebx,1
    pop ecx
    dec cl
    cmp cl,0


    jne read

    searching:
push ecx
mov al , byte[ebx]
mov byte[ele],al
 if:
cmp byte[ele],2
je pos

for:

mov al,byte[ele]
mov ah,0

mov bl,byte[count]
mov bh,0
div bl


cmp ah,0
je neg

inc byte[count]
mov bl,byte[count]
cmp bl,byte[ele]
jne for 

pos:
mov bl,byte[ele]
add byte[sum],bl



neg:
add ebx, 1
pop ecx
loop searching
    





mov ax, word[sum]
    ; mov bl, 1000
    ; div bl
    ; add al, 30h
    ; mov byte[ans1], al

    ;mov ax, dx

    mov bl, 100
    div bl
    mov bh, ah
    ;add al, 30h
    movzx ax, al
    mov bl, 10
    div bl
    add al, 30h
    add ah, 30h
    mov byte[ans1], al
    mov byte[ans2], ah

    movzx ax, bh
    mov bl, 10
    div bl,
    add al, 30h
    mov byte[ans3], al
    add ah, 30h
    mov byte[ans4], ah


mov eax,4
mov ebx,1
mov ecx,ans1
mov edx,1
int 80h


mov eax,4
mov ebx,1
mov ecx,ans2
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,ans3
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,ans4
mov edx,1
int 80h


    mov eax,1
    mov ebx,0
    int 80h
;     isprime:
;     pusha

;     if:
; cmp byte[ele],2
; je pos

; for:

; mov al,byte[ele]
; mov ah,0

; mov bl,byte[count]
; mov bh,0
; div bl


; cmp ah,0
; je neg

; inc byte[count]
; mov bl,byte[count]
; cmp bl,byte[ele]
; jne for 

; pos:
; mov cl,byte[ele]
; add byte[sum],cl
; jmp exit


; neg:

; exit:
; popa
; ret


    
