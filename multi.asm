section .data
	msg1: db "Enter a Number",10
	l1: equ $-msg1
	
section .bss
	num: resw 1
	nod: resw 1
	temp: resb 1
	
section .text

	global _start:
	_start:
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, l1
	int 80h
	
	call read_num
	
	call print_num
	
	mov eax, 1
	mov ebx, 0
	int 80h
	
	
	read_num:

		pusha
		mov word[num],0
		loop:

			mov eax,3
			mov ebx,0
			mov ecx,temp
			mov edx,1
			int 80h
		     
			cmp byte[temp],10
			je end_loop
			
			sub word[temp],30h
			
			mov ax,word[num]
			mov bl,10
			mul bl
			add ax,word[temp]
			mov word[num],ax
			jmp loop

	end_loop: 
		popa
		ret

	print_num:
		pusha
		
		print_loop:
			cmp word[num], 0
			je print_no
			
			inc word[nod]
			mov dx, 0
			
			mov ax, word[num]
			mov bx, 10
			div bx
			push dx
			
			mov word[num], ax
			
			jmp print_loop

		print_no:
			cmp word[nod], 0
			je end_print
			
			dec word[nod]
			pop dx
			
			mov word[temp], dx
			add word[temp], 30h
			
			mov eax,4
			mov ebx,1
			mov ecx,temp
			mov edx,1
			int 80h
			
			jmp print_no
		
		end_print:
			popa
			ret