.MODEL SMALL
.STACK 100H
.DATA

ins db "Enter a number (0-9): $"
o db "Odd number.$"
e db "Even number.$"
nl db 0dh,0ah,'$'

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX

lea dx,ins
mov ah,09h
int 21h

mov ah,01h
int 21h
sub al,'0'     ;ascii to numerical value

mov ah,00h  ;Clear higher byte
mov bl,2
div bl    ;ax=ax/bl(2) -> result in al, remainder in ah

cmp ah,0     
je even     ;if remainder==0
jmp odd        ;else jump to odd

even:
lea dx,nl
mov ah,09h
int 21h

lea dx,e
jmp display

odd:
lea dx,nl
mov ah,09h
int 21h

lea dx,o

display:
mov ah,09h
int 21h


MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN