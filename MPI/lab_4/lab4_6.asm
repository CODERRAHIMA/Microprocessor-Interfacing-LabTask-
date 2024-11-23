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

cmp al,'y'   ;if al==y
je show
cmp al,'Y'   ;if al==Y
je show

jmp end    ;else jump to end

show:
mov dl,al
mov ah,02h
int 21h 
jmp end

end:
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN