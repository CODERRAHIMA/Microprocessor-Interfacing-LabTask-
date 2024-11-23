.MODEL SMALL
.STACK 100H
.DATA

msg1 db "The sum of $"
msg2 db " and $"
msg3 db " is $" 
newline db 0Dh, 0Ah, '$' 

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX

;a)Read two decimal digits whose sum is less than 10
mov ah,01h
int 21h 
sub al,'0'
mov bl,al  

mov ah,01h
int 21h 
sub al,'0'
mov cl,al  


;newline
lea dx,newline
mov ah,09h
int 21h

;b)Display them and their sum on the next line, with an appropriate message.
lea dx,msg1
mov ah,09h
int 21h

add bl,'0'
mov dl,bl
mov ah,02h
int 21h

lea dx,msg2
mov ah,09h
int 21h  
 
add cl,'0'
mov dl,cl
mov ah,02h
int 21h
        
lea dx,msg3
mov ah,09h
int 21h 

add bl,cl
sub bl,'0'
mov dl,bl
mov ah,02h
int 21h
        
MOV AX,4C00H
INT 21H 

MAIN ENDP
END MAIN