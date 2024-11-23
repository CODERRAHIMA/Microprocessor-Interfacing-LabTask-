.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX

mov bx,100  ;set bx to the first term of the sequence
mov ax,0   ;ax-0 for cumulative sum

begin:
cmp bx,5    ;check if bx<5
jl end    ;if bx<5, jump to end

add ax,bx    ;add bx to ax
sub bx,5      ;decrement bx by 5
jmp begin      ;repeat

end:
;now ax contains the sum of the sequence

MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN