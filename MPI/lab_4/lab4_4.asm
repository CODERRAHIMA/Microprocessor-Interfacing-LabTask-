.MODEL SMALL
.STACK 100H
.DATA
     
show_o db "o $"
show_e db "e $"
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

lea dx,nl   ;newline
mov ah,09h
int 21h

cmp bl,1
je odd     ;if al==1
cmp bl,3
je odd     ;if al==3

cmp bl,2
je even     ;if al==2
cmp bl,4
je even     ;if al==4

jmp end

odd:
lea dx,show_o
jmp msg

even:
lea dx,show_e

msg:
mov ah,09h
int 21h
jmp end

end:
MOV AX,4C00H
INT 21H 

MAIN ENDP
END MAIN