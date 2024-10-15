.model small
.stack 100h
.data
.code
main proc
    ; Read a character from the user
    mov ah, 1  
    int 21h

    ; Convert to lowercase by adding 32 to ASCII value
    add al, 32
    mov bl, al

    ; Move cursor to the next line (line feed and carriage return)
    mov ah, 2    
    mov dl, 10
    int 21h
    mov dl, 13    
    int 21h
    
    ; Display the converted character
    mov ah, 2     
    mov dl, bl
    int 21h

    ; Exit the program
    mov ah, 4Ch
    int 21h
main endp
end main
