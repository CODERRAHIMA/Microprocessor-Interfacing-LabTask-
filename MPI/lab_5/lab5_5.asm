.MODEL SMALL
.STACK 100H
.DATA

nl db 0dh,0ah,"$"

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX

mov bx,80h   ;start (80h->128in decimal)
mov cl,0       ;counter for 10 numbers per line

repeat:
cmp cl,10    ;check if 10 numbers are printed
je newline     ;if 10 then go to newline

mov ah,02h
mov dl,bl
int 21h

inc bx       ;increment bx
inc cl        ;increment count
cmp bx,0ffh    ;check if bx reached 225(0ffh)
je end        ;if reached,end the loop

jmp repeat  ;loop back to print next number

newline:    ;print newline
mov dl,0ah     ;line feed
mov ah,02h
int 21h

mov dl,0dh    ;carriage return
mov ah,02h
int 21h

mov cl,0      ;reset counter for 10 num per line
jmp repeat      ;contiue

end:
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN