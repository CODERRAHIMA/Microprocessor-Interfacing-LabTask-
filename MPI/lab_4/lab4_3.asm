.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX

mov ax,-10   ;ax=(-10)=FFF6

cmp ax,0
jl negative   ;if ax<0
je zero   ;if ax=0

mov bx,1  ;if ax is positive 
jmp end

negative: 
mov bx,-1    ;bx=(-1)=FFFF 
jmp end

zero:
mov bx,0     

end:
MOV AX,4C00H
INT 21H     

MAIN ENDP
END MAIN