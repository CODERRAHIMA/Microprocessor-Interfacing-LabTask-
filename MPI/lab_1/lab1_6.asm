.MODEL SMALL
.STACK 100H
.DATA
    A DW 10 ;(A)
    B DW 20 ;(14)
    C DW ?
    
.CODE
MAIN PROC
;iniitialize DS   

MOV AX,@DATA
MOV DS,AX
         
;A=B-A
MOV AX,B  ;AX=B=20(14)
SUB AX,A  ;AX=AX(B)-A=20-10=10=A
MOV A,AX  ;A=AX=B-A=10=A

;A=-(A+1) 
MOV AX,A  ;AX=A=10(A)
ADD AX,1  ;AX=AX+1=10(A)+1=11(B)
NEG AX    ;AX=-AX/AX=-(A+1)=-11(B)=FFF5

;C=A+(B+1);Use INC
MOV AX,A  ;AX=A=10(A)
MOV BX,B  ;BX=B=20(14)
INC BX    ;BX=BX(B)+1=20(14)+1=21(15)
ADD AX,BX ;AX=AX+BX=10(A)+21(15)=31(1F)
MOV CX,AX ;CX=31(1F)

;A=B–(A–1);Use DEC
MOV AX,A  ;AX=A=10(A)
DEC AX    ;AX=AX(A)-1=10(A)=9
MOV BX,B  ;BX=B=20(14)
SUB BX,AX ;BX=BX(B)-AX(A-1)=20(14)-9=11(B)
MOV AX,BX ;AX(A)=11(B)

MOV AX,4C00H
INT 21H        

MAIN ENDP
END MAIN