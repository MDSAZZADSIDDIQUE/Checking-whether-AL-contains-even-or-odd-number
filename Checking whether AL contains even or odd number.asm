;write a program that checks whether AL contains even or odd number.
;Use logical instruction TEST to solve this.

.MODEL SMALL
.STACK 100H

.DATA
INPUT_MESSAGE db "ENTER A DIGIT: $"
EVEN_NUMBER_MESSAGE db "EVEN NUMBER.$"
ODD_NUMBER_MESSAGE db "ODD NUMBER.$"

.CODE
MAIN PROC FAR
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, INPUT_MESSAGE
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    TEST AL, 1
    
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    
    JZ EVEN_NUMBER
    JNZ ODD_NUMBER
    
    EVEN_NUMBER:
    MOV AH, 9
    LEA DX, EVEN_NUMBER_MESSAGE
    INT 21H
    JMP EXIT
    
    ODD_NUMBER:
    MOV AH, 9
    LEA DX, ODD_NUMBER_MESSAGE
    INT 21H
    JMP EXIT
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN