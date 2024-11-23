.MODEL SMALL
.STACK 100H
.DATA

saturday db "Saturday$"
sunday   db "Sunday$"
monday   db "Monday$"
tuesday  db "Tuesday$"
wednesday db "Wednesday$"
thursday db "Thursday$"
friday  db "Friday$"
nl db 0dh,0ah,"$"

.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX

mov ah,01h
int 21h
sub al,30h
mov bl,al

lea dx,nl
mov ah,09h
int 21h

cmp bl,1
je print_sat  ;jump if bl==1
cmp bl,2
je print_sun
cmp bl,3
je print_mon
cmp bl,4
je print_tue
cmp bl,5
je print_wed
cmp bl,6
je print_thurs
cmp bl,7
je print_fri

print_sat:
lea dx,saturday
jmp print_msg

print_sun:
lea dx,sunday
jmp print_msg

print_mon:
lea dx,monday
jmp print_msg

print_tue:
lea dx,tuesday
jmp print_msg

print_wed:
lea dx,wednesday
jmp print_msg

print_thurs:
lea dx,thursday
jmp print_msg

print_fri:
lea dx,friday
jmp print_msg

print_msg:
mov ah,09h
int 21h


MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN