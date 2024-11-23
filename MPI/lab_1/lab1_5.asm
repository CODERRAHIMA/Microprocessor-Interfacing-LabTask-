.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
;iniitialize DS  

MOV AX,@DATA
MOV DS,AX
               
MOV AX,5
MOV BX,3

ADD AX,BX   ;AX=AX+BX=5+3=8     AX=8
SUB BX,AX   ;BX=BX-AX=3-8=-5     BX=-5 (bin:1011/dec:11/hexa:FFFB)
ADD AX,BX   ;AX=AX+BX=8+(-5)=3  AX=3


MOV AX,4C00H
INT 21H    

MAIN ENDP
END MAIN