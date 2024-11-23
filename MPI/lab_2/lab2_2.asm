.MODEL SMALL
.STACK 100H
.DATA
    A DW 4
    B DW 3
    C DW 8
    D DW 2
    E DW 3
    RESULT DW ?
    
.CODE
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    ; A + B
    MOV AX, A
    ADD AX, B
    
    ; C - D
    MOV BX, C
    SUB BX, D
    
    ; (A + B) * (C - D)
    IMUL BX           ; AX = AX * BX
    
    ; (A + B) * (C - D) / E
    MOV BX, E
    XOR DX, DX        
    IDIV BX           ; AX = AX / BX
    
    MOV RESULT, AX    
    
    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
END MAIN