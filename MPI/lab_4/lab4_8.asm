.MODEL SMALL
.STACK 100H
.DATA

ins db "Enter a character: $"
vow db "The character is Vowel.$"
cons db "The character is constant.$"
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

lea dx,nl   ;newline
mov ah,09h
int 21h

cmp bl,'A'
je vowel     ;if bl==A
cmp bl,'E'
je vowel 
cmp bl,'I'
je vowel 
cmp bl,'O'
je vowel 
cmp bl,'U'
je vowel 
cmp bl,'a'
je vowel 
cmp bl,'e'
je vowel 
cmp bl,'i'
je vowel 
cmp bl,'o'
je vowel 
cmp bl,'u'
je vowel 

jmp constant     ;else jump to constant

vowel:
lea dx,vow
mov ah,09h
int 21h 
jmp end 

constant:
lea dx,cons
mov ah,09h
int 21h

end:
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN