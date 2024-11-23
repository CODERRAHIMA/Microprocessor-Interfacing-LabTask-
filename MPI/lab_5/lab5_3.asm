.MODEL SMALL
.STACK 100H
.DATA

nl db 0dh,0ah,"$"

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX

mov bl,0

begin:
cmp bl,5  ;check if 5 char have been read
jge second    ;if bl>=5 jump to second
mov ah,01h
int 21h
inc bl
jmp begin    ;repeat until 5 char are read

second:   
lea dx,nl     ;newline
mov ah,09h
int 21h

mov cl,0   ;initialize cl to 0 (* count)

third:
cmp cl,5   ;check if 5 * have been printed
jge end     ;if cl>=5 jump to end
mov ah,02h
mov dl,"*"    ;output *
int 21h
inc cl       ;Increment * count
jmp third   ;Repeat until 5 * are printed


end:
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN