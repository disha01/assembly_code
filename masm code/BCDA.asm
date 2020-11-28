.MODEL TINY
.486
.CODE
ad dd ?
msg2 db 13,10,"difference of the numbers are: $"

.STARTUP
MOV EBX,12791279H
MOV ECX,3A973A97H
MOV EDX,00000000H

MOV AL,BL
ADD AL,CL
DAA
MOV DL,AL

MOV AL,BH
ADC AL,CH
DAA
MOV DH,AL

BSWAP EDX
BSWAP EBX
BSWAP ECX

MOV AL,BH
ADC AL,CH
DAA
MOV DH,AL

MOV AL,BL
ADC AL,CL
DAA
MOV DL,AL

BSWAP EDX
mov ad,edx

mov dx,offset msg2   ; printing the sub
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