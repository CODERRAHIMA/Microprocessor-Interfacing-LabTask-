.MODEL SMALL
.STACK 100H
.DATA

show_i db "i$"
show_k db "k$"
show_l db "l$"
show_m db "m$"
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

lea dx,nl
mov ah,09h
int 21h

cmp bl,3
jle print_i   ;Jump if bl<=3

cmp bl,6
jle print_k   ;Jump if bl<=6

cmp bl,9
jle print_l   ;Jump if bl<=9

cmp bl,10
je print_m   ;Jump if bl==10
 
 
print_i:
lea dx,show_i
mov ah,09h
int 21h
jmp end

print_k:
lea dx,show_k
mov ah,09h
int 21h
jmp end

print_l:
lea dx,show_l
mov ah,09h
int 21h
jmp end

print_m:
lea dx,show_m
mov ah,09h
int 21h

end:
MOV AX,4C00H
INT 21H

MAIN ENDP
END MAIN