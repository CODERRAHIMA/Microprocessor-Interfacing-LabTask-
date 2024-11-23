.MODEL SMALL
.STACK 100H
.DATA

msg db "Enter Three Initials: $"
newline db 0dh, 0ah, '$'

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX

lea dx,msg 
mov ah,09h
int 21h

;read input
mov ah,01h
int 21h
mov bl,al

mov ah,01h
int 21h
mov cl,al

mov ah,01h
int 21h
mov bh,al 

lea dx,newline 
mov ah,09h
int 21h

;Display them down the left margin.

mov dl,bl
mov ah,02h
int 21h

lea dx,newline
mov ah,09h
int 21h   

mov dl,cl
mov ah,02h
int 21h

lea dx,newline
mov ah,09h
int 21h

mov dl,bh
mov ah,02h
int 21h

MOV AX,4C00H
INT 21H 

MAIN ENDP
END MAIN