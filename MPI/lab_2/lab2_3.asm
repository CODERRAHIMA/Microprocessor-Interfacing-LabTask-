.MODEL SMALL
.STACK 100H
.DATA
    RESULT DW ?
    
.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX
    
    ; (1 + 2) = 3
    MOV AL, 1
    ADD AL, 2
    
    ; (3 - 1) = 2
    MOV BL, 3
    SUB BL, 1
    
    MUL BL    ;(1+2)*(3-1)=6
    MOV CL, 5
    DIV CL    ; 6/5=1    
          
    
    ADD AL, 3  ;1+3=4
        
    ADD AL, 2   ;4+2=6
    
    ; (1 * 2)   ;1*2=2
    MOV DL,AL
    MOV AL,1
    MOV BL,2
    MUL BL
    
    SUB DL,AL   ;6-2=4
    
    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
END MAIN