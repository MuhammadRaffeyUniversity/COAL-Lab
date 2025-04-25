.MODEL SMALL
.STACK 100H
.DATA
prompt db "Enter password (max 20 chars): $"
strongMsg db 13,10,'Password is Strong$'
upperMsg  db 13,10,'Add an uppercase letter.$'
lowerMsg  db 13,10,'Add a lowercase letter.$'
digitMsg  db 13,10,'Add a digit.$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA DX, prompt
    MOV AH, 09h  
    INT 21h

    MOV BL, 0
    XOR CX, CX            

ReadLoop:
    MOV AH, 01h          
    INT 21h
    CMP AL, 13           
    JE DoneReading

    CMP AL, 'A'
    JL CheckLower
    CMP AL, 'Z'
    JG CheckLower
    OR BL, 00000001b  
    JMP Next

CheckLower:
    CMP AL, 'a'
    JL CheckDigit
    CMP AL, 'z'
    JG CheckDigit
    OR BL, 00000010b      
    JMP Next

CheckDigit:
    CMP AL, '0'
    JL Next
    CMP AL, '9'
    JG Next
    OR BL, 00000100b     

Next:
    INC CX
    CMP CX, 20            
    JL ReadLoop

DoneReading:
    CMP BL, 7
    JE AllGood

    TEST BL, 00000001b
    JNZ CheckLowerFlag
    LEA DX, upperMsg
    MOV AH, 09h
    INT 21h

CheckLowerFlag:
    TEST BL, 00000010b
    JNZ CheckDigitFlag  
    LEA DX, lowerMsg
    MOV AH, 09h
    INT 21h

CheckDigitFlag:
    TEST BL, 00000100b
    JNZ EndProgram       
    LEA DX, digitMsg
    MOV AH, 09h
    INT 21h
    JMP EndProgram

AllGood:
    LEA DX, strongMsg
    MOV AH, 09h
    INT 21h

EndProgram:
    MOV AH, 4Ch           
    INT 21h

MAIN ENDP
END MAIN
