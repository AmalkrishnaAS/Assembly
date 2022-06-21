section .data
msg1: db "enter the size of the array1",10
l1:equ $-msg1
msg2:db "enter the size of the array2",10
l2:equ $-msg2
msg3: db "enter the element",10
l3:equ $-msg3
nwl: db 10


section .bss
arr1: resb 50
arr2: resb 50
size1: resb 1
size2: resb 1
digit1: resb 1
digit2: resb 1
temp: resb 1
sizepass:resb 1
arraypass:resb 1
eleoass:resb 1

section .text
global _start
_start:



