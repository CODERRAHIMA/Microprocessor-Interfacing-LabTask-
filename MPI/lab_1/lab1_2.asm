.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
;iniitialize DS  

MOV AX,@DATA
MOV DS,AX

MOV AX,1234H   ;taking input
MOV BX,5678H

MOV CX,AX
MOV AX,BX
MOV BX,CX


MOV AX,4C00H
INT 21H    

MAIN ENDP
END MAIN