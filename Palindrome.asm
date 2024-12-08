.MODEL SMALL
.STACK 100H
.DATA

; The string to be checked for palindrome
STR DB 'abba', 0       ; Null-terminate the string
len equ ($-STR)-1      ; Adjust length to exclude the null terminator
STRING1 DB 'String is palindrome', '$'
STRING2 DB 'String is not palindrome', '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Initialize loop counters
    mov cx, len/2
    mov si, 0
    mov di, len-1

LOOP1:
    mov al, [si+STR]    ; Load character from the start of the string
    mov bl, [di+STR]    ; Load character from the end of the string
    cmp al, bl          ; Compare characters from start and end
    jne OUTPUT2         ; If not equal, jump to OUTPUT2 (not palindrome)
    inc si              ; Increment SI to move forward
    dec di              ; Decrement DI to move backward
    loop LOOP1          ; Repeat until half the string is checked

OUTPUT1:
    ; Load address of STRING1 (palindrome message)
    LEA DX, STRING1
    MOV AH, 09H
    INT 21H
    JMP EXIT            ; Jump to program exit

OUTPUT2:
    ; Load address of STRING2 (not palindrome message)
    LEA DX, STRING2
    MOV AH, 09H
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
