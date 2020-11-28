.model small
.data
.486
data1 dd 00343452h
data2 dd 10114452h
ad dd ?
msg2 db 13,10,"sum of the numbers are: $"
.code
.startup

mov eax,data1
mov ebx,data2

add eax,ebx
mov ad,eax

mov dx,offset msg2   ; printing the sum
mov ah,09
int 21h

mov ebx,ad
mov cx,4
abc3 :rol ebx,8

mov al,bl
and al,0f0h
shr al,4
add al,30h

cmp al,39h
jbe ab5
add al,07h

ab5:
mov dl,al
mov ah,02
int 21h

mov al,bl
and al,00fh
add al,30h

cmp al,39h
jbe ab6

add al,07h
ab6:

mov dl,al
mov ah,02
int 21h
loop abc3

.EXIT
END