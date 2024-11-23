.MODEL SMALL
.STACK 100H
.DATA

days31 db "31 days$"
days30 db "30 days$"
days28 db "28 or 29 days (February)$"
nl db 0dh,0ah,"$"

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX

mov ah,01h
int 21h
sub al,30h
mov bl,al

;newline
lea dx,nl
mov ah,09h
int 21h

cmp bl,2
je feb    ;jump if bl==2 

cmp bl,4
je show_day30  ;(jump if bl==4) april=30days

cmp bl,6
je show_day30  ;june=30days

cmp bl,9
je show_day30  ;september=30days

cmp bl,11
je show_day30  ;november=30days

jmp show_day31 ;else all other months have 31days

feb:
lea dx,days28
mov ah,09h
int 21h
jmp end

show_day30:
lea dx,days30
mov ah,09h
int 21h
jmp end

show_day31:
lea dx,days31
mov ah,09h
int 21h

end:
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN