.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX

mov ah,01h
int 21h

cmp al,'A'
jl not_upper  ;if less than A
cmp al,'Z'
jg not_upper  ;if greater than Z

mov dl,al
mov ah,02h
int 21h

not_upper:
MOV AX,4C00H
INT 21H 

MAIN ENDP
END MAIN