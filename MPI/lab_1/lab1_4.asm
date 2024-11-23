.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
;iniitialize DS  

MOV AX,@DATA
MOV DS,AX

MOV AX,5
MOV BX,3
            
;5-3=2
SUB AX,BX   
 
;if AX - BX results in a negative number,AX will contain the two’s complement representation of the result.

MOV AX,4C00H
INT 21H    

MAIN ENDP
END MAIN