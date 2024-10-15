.model small
.stack 100h
.code
main proc
    ; Read a character from the user
    mov ah, 1          ; Function to read character
    int 21h            ; Call DOS interrupt
    sub al, 32         ; Convert LowerCase to UpperCase
    mov bl, al         ; Store the result in BL

    ; New line
    mov ah, 2          ; Function to output a character
    mov dl, 10         ; Line feed
    int 21h            ; Call DOS interrupt
    mov dl, 13         ; Carriage return
    int 21h            ; Call DOS interrupt

    ; Output the converted character
    mov ah, 2          ; Function to output a character
    mov dl, bl         ; Move the result to DL
    int 21h            ; Call DOS interrupt

    ; Exit the program
    mov ah, 4Ch        ; Function to exit program
    int 21h            ; Call DOS interrupt
main endp
end main
