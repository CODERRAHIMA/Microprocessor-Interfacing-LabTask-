.MODEL SMALL
.STACK 100H
.DATA

ins db "Enter 3 numbers: $"
max db "Maximum number is: $"
min db "Minimum number is: $"   
nl db 0dh,0ah,"$"

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX

lea dx,ins
mov ah,09h
int 21h

mov ah,01h
int 21h
mov bl,al

mov ah,01h
int 21h
mov cl,al

mov ah,01h
int 21h
mov ch,al

lea dx,nl   ;newline
mov ah,09h
int 21h 


;find maximum

cmp bl,cl   
jng num2   ;if bl is not >= cl then cl>bl and go to num2 
cmp bl,ch  ;if bl is >= cl then cmp bl with ch
jng num3    ;if bl is not >= ch then ch is the max value and go to num3
       
mov dl,bl   ;if bl is still max then load bl to dl and display maxvalue
jmp displaymax

num2:
cmp cl,ch  ;if cl>=ch then max value is cl
jng num3     ;else go to num3

lea dx,max
mov ah,9
int 21h 

mov dl,cl
jmp displaymax

num3:
lea dx,max  ;ch is max value
mov ah,9
int 21h 

mov dl,ch
jmp displaymax

displaymax:
mov ah,02h
int 21h
         
         
;newline
lea dx,nl   
mov ah,9
int 21h 


;find minimum

cmp bl,cl   
jnl num4    
cmp bl,ch    
jnl num5      

lea dx,min
mov ah,9
int 21h  

mov dl,bl
jmp displaymin

num4:
cmp cl,ch
jnl num5

lea dx,min
mov ah,9
int 21h

mov dl,cl
jmp displaymin    

num5:
lea dx,min
mov ah,9
int 21h 

mov dl,ch
jmp displaymin

displaymin:
mov ah,02h
int 21h

end:
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN