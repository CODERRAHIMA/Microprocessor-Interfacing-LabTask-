.MODEL SMALL
.STACK 100H
.DATA

ins db "Enter 3 sides of the triangle: $"    
yes db "Y$"
no db "N$"
nl db 0dh, 0ah, "$" 
    
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
sub al,30h
mov bl,al  

mov ah,01h
int 21h
sub al,30h
mov cl,al

mov ah,01h
int 21h
sub al,30h
mov ch,al 

lea dx,nl
mov ah,09h
int 21h 

;valid if bl+cl>ch or bl+ch>cl or cl+ch>bl
  
mov al,bl
add al,cl
cmp al,ch
jng not_valid ;jump to invalid if bl+cl<=ch 

mov al,bl
add al,ch
cmp al,cl
jng not_valid  ;jump to invalid if bl+ch<=cl

mov al,cl
add al,ch
cmp al,bl
jng not_valid    ;jump to invalid if cl+ch<=bl   
jmp valid 


valid:
lea dx,yes
mov ah,09h
int 21h
jmp end

not_valid:
lea dx,no
mov ah,09h
int 21h  
 
end:
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN