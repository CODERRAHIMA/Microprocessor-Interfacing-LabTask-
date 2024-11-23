.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX

mov al,41h   ;41h->65->'A'
mov bl,42h    ;42h->66->'B'

cmp al,bl
jle dis_al    ;jle -> al<=bl

mov dl,bl
jmp dis_char

dis_al:
mov dl,al

dis_char:
mov ah,02h
int 21h     
      

MOV AX,4C00H
INT 21H     

MAIN ENDP
END MAIN