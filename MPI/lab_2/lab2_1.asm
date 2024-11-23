.MODEL SMALL
.STACK 100H
.DATA
    X DW 6      
    Y DW 3
    Z DW 2
    RESULT1 DW ?
    RESULT2 DW ?
    RESULT3 DW ?
    
.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX
    
    ; 1. X * Y
    MOV AX, X          
    MOV BX, Y          
    IMUL BX            ; ax = ax * bx
    MOV RESULT1, AX    
    
    ; 2. X / Y
    MOV AX, X          
    MOV BX, Y          
    XOR DX, DX         
    IDIV BX            ; AX = AX / BX
    MOV RESULT2, AX    
    
    ; 3. X * Y / Z
    MOV AX, X          
    MOV BX, Y          
    IMUL BX            ; AX = AX * BX
    MOV BX, Z          
    IDIV BX            ; AX = AX / BX
    MOV RESULT3, AX   
    
    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
END MAIN