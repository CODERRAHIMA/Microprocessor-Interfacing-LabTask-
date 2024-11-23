.MODEL SMALL
.STACK 100H
.DATA

yes db "Divisible by 5 and 11$"
no db "Not divisible by 5 and 11$" 

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX

mov ax,55
mov cx,ax

mov dx,0   ;clear dx
mov bx,5     ;load 5 to bx
div bx        ;ax=ax/bx=55/5
cmp dx,0        ;checking remainder 
jne not_div       ;if not zero

mov ax,cx     
mov dx,0 
mov bx,11     ;load 11 to bx
div bx           ;ax=ax/bx=55/11
cmp dx,0          ;checking remainder 
jne not_div        ;if not zero

jmp divi   ;if zero jump to divi

not_div:
lea dx,no   ;show -> Not divisible by 5 and 11
mov ah,09h
int 21h
jmp end

divi:       ;show -> divisible by 5 and 11
lea dx,yes
mov ah,09h
int 21h

end:
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN