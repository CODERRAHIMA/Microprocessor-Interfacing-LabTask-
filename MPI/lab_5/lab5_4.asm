.MODEL SMALL
.STACK 100H
.DATA

nl db 0dh,0ah,"$"

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX

mov cx, 0      ;product initialized to 0
mov ax, 3     ;multiplicand->3
mov bx, 2    ;multiplier->2

repeat_for_addition:
add cx, ax     ;add m (AX) to product (CX)
dec bx           
cmp bx, 0        ;check if n (BX) is 0
jne repeat_for_addition

mov ah, 2        
mov dl, cl   ;Load result (low byte of CX) into DL
add dl, 48     ;ASCII:'0'->48
int 21h 

MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN