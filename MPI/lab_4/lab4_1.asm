.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX

mov ax,-10  ;ax=(-10)=FFF6

cmp ax,0
jge not_negetive    ;jge -> ax>=0

mov ax,5  ;ax=5

not_negetive:
MOV AX,4C00H
INT 21H 

MAIN ENDP
END MAIN