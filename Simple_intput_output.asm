.model small
.stack 100h
.code

main proc 

    mov ah,1        ;function to take a single character input
    int 21h         ;calling the function
    mov bl,al       ;cant keep anything in al so keeping in bl

    mov ah,2
    mov dl,10       ;function for newline in ascii
    int 21h
    mov dl,13       ;function for cret in ascii 
    int 21h
    
    mov ah,2        ; function to print a single character
    mov dl,bl       ; dl prints the character
    int 21h         ; calling the function

    exit :           ;exiting program
    mov ah,4ch
    int 21h

main endp

end main
    