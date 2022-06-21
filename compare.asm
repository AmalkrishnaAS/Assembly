; cmpleft ,right sets flags

; ja jump if above
; jae jump if above or equal
; jb jump if below
; jbe jump if below or equal
; je jump if equal
; jne jump if not equal
; jg jump if greater for signed
; jge jump if greater or equal for signed
; jl jump if less for signed
; jle jump if less or equal for signed
; jng jump if not greater for signed
; jnge jump if not greater or equal for signed
; jnl jump if not less for signed
; jnle jump if not less or equal for signed
; jno jump if not overflow
; jnp jump if not parity
; jns jump if not sign
; jo jump if overflow
; jp jump if parity
; js jump if sign
; jz jump if zero is set



;if statement in assembly 


section .bss
bit :resb 2


section .data
msg: db "enter bit value",10
l: equ $-msg
msg1: db "bit is set",10
l1: equ $-msg1
msg2: db "bit is not set",10
l2: equ $-msg2





section .text

global _start:
_start:

mov eax,4
mov ebx,1
mov ecx,msg
mov edx,l
int 80h

mov eax,3
mov ebx,0
mov ecx,bit
mov edx,2
int 80h

sub word[bit],30h


mov al,byte[bit]
cmp al,1
je else


; if block goes here

mov eax,4
mov ebx,1
mov ecx,msg2
mov edx,l2
int 80h
jmp exit

; endif


else:
mov eax,4
mov ebx,1
mov ecx,msg1
mov edx,l1
int 80h
jmp exit

exit:
mov eax,1
mov ebx,0
int 80h