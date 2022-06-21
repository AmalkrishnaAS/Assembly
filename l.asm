section .data
msg1: db 'enter the size of the array', 10, 0
msg2: db 'enter the array elements', 10, 0
l1: equ $-msg1
l2: equ $-msg2
nwl: db 10
n1: equ $-nwl

section .bss
digit1: resb 1
digit2: resb 1
size: resb 1
array: resb 50  ;50 is the size of the array

