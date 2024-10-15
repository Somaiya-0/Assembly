.model small            ; Use the small memory model for the program.
.stack 100h             ; Set up a stack size of 256 bytes (100h).
.data
    b db "1st number : $" ; Define a message for the first number prompt.
    c db "2nd number : $" ; Define a message for the second number prompt.
    a db "sum = $"        ; Define a message to display the sum.

.code
main proc
    ; Initialize the data segment
    mov ax, @data       ; Load the address of the data segment into AX.
    mov ds, ax          ; Move the address from AX into DS to set up the data segment.

    ; Display a placeholder character ('?') to the screen.
    mov ah, 02h         ; Function 02h: Display a character.
    mov dl, '?'         ; Character to display.
    int 21h             ; Interrupt to display the character.

    ; Read the first character input from the user.
    mov ah, 01h         ; Function 01h: Input a character.
    int 21h             ; Interrupt to read input into AL.
    mov bl, al          ; Store the input character in BL.

    ; Read the second character input from the user.
    mov ah, 01h         ; Function 01h: Input a character.
    int 21h             ; Interrupt to read input into AL.
    mov bh, al          ; Store the input character in BH.

    ; Move cursor to the next line (carriage return and line feed).
    mov ah, 02h         ; Function 02h: Display a character.
    mov dl, 13          ; ASCII code for carriage return.
    int 21h             ; Interrupt to move to the beginning of the next line.
    mov dl, 10          ; ASCII code for line feed.
    int 21h             ; Interrupt to move the cursor down one line.

    ; Display "1st number :".
    lea dx, b           ; Load the address of the message "1st number :" into DX.
    mov ah, 09h         ; Function 09h: Display a string.
    int 21h             ; Interrupt to display the string.

    ; Display the first input character.
    mov ah, 02h         ; Function 02h: Display a character.
    mov dl, bl          ; Load the first input character into DL.
    int 21h             ; Interrupt to display the character.

    ; Move cursor to the next line (carriage return and line feed).
    mov ah, 02h
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

    ; Display "2nd number :".
    lea dx, c           ; Load the address of the message "2nd number :" into DX.
    mov ah, 09h         ; Function 09h: Display a string.
    int 21h             ; Interrupt to display the string.

    ; Display the second input character.
    mov ah, 02h         ; Function 02h: Display a character.
    mov dl, bh          ; Load the second input character into DL.
    int 21h             ; Interrupt to display the character.

    ; Move cursor to the next line (carriage return and line feed).
    mov ah, 02h
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

    ; Add the values of BL and BH (which hold the input characters).
    add bl, bh          ; Add the ASCII values of the input characters and store in BL.

    ; Display "sum = ".
    lea dx, a           ; Load the address of the message "sum =" into DX.
    mov ah, 09h         ; Function 09h: Display a string.
    int 21h             ; Interrupt to display the string.

    ; Convert the sum from ASCII to decimal by subtracting 30h.
    mov ah, 02h         ; Function 02h: Display a character.
    sub bl, 30h         ; Adjust the sum value to display the correct ASCII value.
    mov dl, bl          ; Load the adjusted sum into DL.
    int 21h             ; Interrupt to display the sum.

    ; Exit the program.
    mov ah, 4Ch         ; Function 4Ch: Exit program.
    int 21h             ; Interrupt to terminate the program.
main endp
end main
