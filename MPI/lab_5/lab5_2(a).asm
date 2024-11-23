.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX

mov bx,1  ;bx=1 the first term of the sequence
mov ax,0    ;ax=0 to hold the cumulative sum

begin:
cmp bx,148  ;cmp current value in bx with the end term 148
jg end   ;jump to end if bx>148

add ax,bx   ;add current value bx to ax
add bx,3      ;increment bx by 3
jmp begin   ;jump back to the begin

end:    
mov cx,ax  ;cx=cumulative sum
;display the upper byte of cx
mov dl,ch
mov ah,02h
int 21h

;display the lower byte of cx
mov dl,cl
mov ah,02h
int 21h 

MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN