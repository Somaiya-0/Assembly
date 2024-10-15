.model small          ; Defines the memory model as 'small' for the program.
.stack 100h           ; Allocates 256 bytes for the stack.

.data
    MsgTotal db 'Total marks of Maths and Physics: $'  ; Message to display total marks.
    MsgEligible db 'The candidate is eligible.$'       ; Message to display if the candidate is eligible.
    MsgNotEligible db 'The candidate is not eligible.$' ; Message to display if the candidate is not eligible.
    MarksPhy db ?       ; Variable to store Physics marks.
    MarksMath db ?      ; Variable to store Mathematics marks.

.code
main proc
    mov ax, @data       ; Load the data segment address into AX.
    mov ds, ax          ; Initialize DS with the data segment address.

    ; Input Physics marks
    mov ah, 1           ; Function to read a character from keyboard.
    int 21h             ; Interrupt 21h to take input.
    sub al, 48          ; Convert ASCII input to numerical value.
    mov MarksPhy, al    ; Store Physics marks in the variable.

    ; Input Mathematics marks
    mov ah, 1           ; Function to read another character from keyboard.
    int 21h             ; Interrupt 21h to take input.
    sub al, 48          ; Convert ASCII input to numerical value.
    mov MarksMath, al   ; Store Mathematics marks in the variable.

    ; Calculate total marks
    add al, MarksPhy    ; Add Physics marks to Mathematics marks.
    mov ah,0            ; Clear the high byte of AX for arithmetic adjustment.
    aaa                 ; Adjust ASCII after addition (corrects the result).

    add ah,48           ; Convert the high digit to ASCII.
    add al,48           ; Convert the low digit to ASCII.
     
    mov bx, ax          ; Store the total marks in BX.

    ; Print newline and carriage return for formatting.
    mov dl, 10          ; Line feed (move cursor to the next line).
    mov ah, 2           ; Function to display a character.
    int 21h             ; Interrupt 21h for output.
    mov dl, 13          ; Carriage return (move cursor to the beginning of the line).
    mov ah, 2           ; Function to display a character.
    int 21h             ; Interrupt 21h for output.

    ; Print total marks message
    mov dx, offset MsgTotal ; Load the address of the message.
    mov ah, 9           ; Function to display a string.
    int 21h             ; Interrupt 21h to display the message.

    ; Print total marks (2-digit output)
    mov ah, 2           ; Function to display a character.
    mov dl, bh          ; Load high digit into DL.
    int 21h             ; Display high digit.
   
    mov ah, 2           ; Function to display a character.
    mov dl, bl          ; Load low digit into DL.
    int 21h             ; Display low digit.

    ; Print newline and carriage return for formatting.
    mov dl, 10          ; Line feed.
    mov ah, 2           ; Function to display a character.
    int 21h             ; Interrupt 21h for output.
    mov dl, 13          ; Carriage return.
    mov ah, 2           ; Function to display a character.
    int 21h             ; Interrupt 21h for output.
    
    ; Check eligibility based on conditions.
    cmp MarksPhy, 5     ; Compare Physics marks with 5.
    jb NotEligible      ; Jump if marks are below 5.

    cmp MarksMath, 7    ; Compare Mathematics marks with 7.
    jb NotEligible      ; Jump if marks are below 7.
   
    cmp bx, 12          ; Compare total marks with 12.
    jb NotEligible      ; Jump if total marks are below 12.

    ; If eligible, display eligible message.
    mov dx, offset MsgEligible
    jmp PrintMessage    ; Jump to print the message.

NotEligible:
    ; If not eligible, display not eligible message.
    mov dx, offset MsgNotEligible

PrintMessage:
    mov ah, 9           ; Function to display a string.
    int 21h             ; Interrupt 21h to display the message.

Exit:
    mov ax, 4c00h       ; Terminate the program.
    int 21h             ; Interrupt 21h for program termination.
main endp
end main               ; End of the program.
