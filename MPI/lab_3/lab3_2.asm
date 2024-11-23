.MODEL SMALL
.STACK 100H
.DATA

    a db "Enter the first number: $" 
    b db "Enter the second number: $" 
    res db "Result: $"
    newline db 0dh,0ah,'$'
    
.CODE
MAIN PROC
;iniitialize DS

MOV AX,@DATA
MOV DS,AX
    
    lea dx,a
    mov ah,09h
    int 21h
        
    mov ah,01h
    int 21h 
    sub al,'0'
    mov bl,al 
    
    lea dx,newline
    mov ah,09h
    int 21h
    
    lea dx,b
    mov ah,09h
    int 21h
    
    mov ah,01h
    int 21h 
    sub al,'0'
    mov cl,al  
    
    ;mov al,bl
    add bl,cl 
    add bl,'0'
    
    lea dx,newline
    mov ah,09h
    int 21h
    
    lea dx,res
    mov ah,09h
    int 21h
    
    
    mov dl,bl
    mov ah,02h
    int 21h
    
    
MOV AX,4C00H
INT 21H  

MAIN ENDP
END MAIN