.MODEL SMALL
.STACK 100H 
.DATA
    msg1  db 'Enter the Hex digit (A-F): $'    
    msg2  db 'The corresponding Decimal digit is: $'
    newline db 0dh,0ah,'$' 
 
.CODE
MAIN PROC
MOV AX, @DATA                
MOV DS, AX
    
;printing msg1 
lea dx,msg1
mov ah,09h
int 21h

;input hex digit(A-F)   
mov ah,01h    ;C=12=43h
int 21h
    
mov bl,al  ;bl=al=12(c)=43h 
    
;printing newline
lea dx,newline
mov ah,09h
int 21h              

;printing msg2
lea dx,msg2
mov ah,09h
int 21h

;printing the first decimal digit ('1')
mov ah,02h
mov dl,31h    ;'1' in ASCII
int 21h

;Convert hex to its decimal (A=10, B=11, C=12, ..., F=15)
sub bl,11h                 ; Adjust A-F (A=41H -> 10, B=42H -> 11, C=43H -> 12,..., F=46H -> 15)
              
mov dl,bl
int 21h

MOV AH, 4CH                  
INT 21H 

MAIN ENDP
END MAIN
