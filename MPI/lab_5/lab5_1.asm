.MODEL SMALL
.STACK 100H
.DATA

nl db 0dh,0ah,"$"

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX

mov cx,80  ;set counter to 80

print_star:
mov ah,02h
mov dl, "*"   ;load star(*) character into dl
int 21h

loop print_star   ;repeat until cx=0

lea dx,nl
mov ah,09h
int 21h

MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN