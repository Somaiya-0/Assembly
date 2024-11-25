.model small
.stack 100h
.data
    msg db 'Absolute value: $'
    buffer db 5,?, 5 dup(?)   ; Buffer to store the input
.code
main proc
    mov ax, @data
    mov ds, ax 

    MOV AH, 01h        ; Function 01h - Read a character from standard input
    INT 21h            ; Call interrupt to get a character (will be '-')
    
    CMP AL, 2Dh        ; Check if the character is a minus sign ('-')
    JE NegativeInput   ; Jump to NegativeInput if it's a minus sign
    
    ; Continue with positive number processing here
    ; ...
    
    NegativeInput:
    MOV AH, 01h        ; Function 01h - Read the next character (will be '3')
    INT 21h            ; Get the character '3'
    SUB AL, 30h        ; Convert ASCII '3' to integer (AL = 3)
    NEG AL             ; Make it negative (AL = -3)
    
    ; Now AL holds the value -3


    ; Check if negative and find absolute value
    cmp bl, 0
    jge positive
    neg bl              ; Make positive if negative

positive:
    ; Print message
    mov ah, 09h
    lea dx, msg
    int 21h

    ; Convert number to ASCII for printing
    add bl, '0'
    mov dl, bl
    mov ah, 02h
    int 21h

    ; Exit
    mov ah, 4Ch
    int 21h
main endp
end main
