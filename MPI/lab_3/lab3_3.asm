.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX

;a)Read a character, and display it at the next position on the same line. 
mov ah,01h
int 21h

mov ah,02h
mov dl,al
int 21h 

;for newline
mov ah,02h
mov dl,0dh
int 21h
mov dl,0ah
int 21h

;b)Read an uppercase letter, and display it at the next position on the same line in lower case.  
mov ah,01h
int 21h

sub al,'A'
add al,'a'
mov dl,al
mov ah,02h
int 21h  

;for newline
mov ah,02h
mov dl,0dh
int 21h
mov dl,0ah
int 21h

;c)Read an uppercase letter, and display it at the next position on the next line in lower case. 
mov ah,01h
int 21h

sub al,'A'
add al,'a' 
mov bl,al

;for newline
mov ah,02h
mov dl,0dh
int 21h
mov dl,0ah
int 21h

mov dl,bl
mov ah,02h
int 21h

MOV AX,4C00H
INT 21H

MAIN ENDP
END MAIN