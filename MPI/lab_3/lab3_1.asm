.MODEL SMALL
.STACK 100H
.DATA

a db "Please enter a char: $"
b db "Inserted char: $"

.CODE
MAIN PROC
;iniitialize DS

MOV AX,@DATA
MOV DS,AX

lea dx,a   ;showing "Please enter a char: "
mov ah,9
int 21h

mov ah,1
int 21h    ;taking user input  

mov bl,al

mov ah,2     
mov dl,0dh    ;Carriage Return
int 21h
mov dl,0ah    ;for newline
int 21h

lea dx,b    ;showing "Inserted char: "
mov ah,9
int 21h

mov ah,2     ;showing output
mov dl,bl
int 21h

MOV AX,4C00H
INT 21H 

MAIN ENDP
END MAIN