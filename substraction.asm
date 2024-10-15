.model small
.stack 100h
.data
    a db ?               ; Variable to store the second character
    prompt1 db "Enter first number (0-9): $"
    prompt2 db "Enter second number (0-9): $"
    result_msg db "Difference: $"
.code
main proc
    ; Initialize the data segment
    mov ax, @data
    mov ds, ax

    ; Prompt for first number
    lea dx, prompt1      
    mov ah, 09h          
    int 21h              

    ; Read first number
    mov ah, 01h          
    int 21h              
    sub al, 30h          
    mov bl, al          

    ; New line
    mov ah, 02h
    mov dl, 10          
    int 21h
    mov dl, 13          
    int 21h

    ; Prompt for second number
    lea dx, prompt2      
    mov ah, 09h          
    int 21h              

    ; Read second number
    mov ah, 01h          
    int 21h              
    sub al, 30h          
    mov a, al            

    ; Subtract
    sub bl, a           

    ; New line
    mov ah, 02h
    mov dl, 10          
    int 21h
    mov dl, 13          
    int 21h

    ; Display result message
    lea dx, result_msg   
    mov ah, 09h          
    int 21h              

    ; Display difference
    add bl, 30h          
    mov ah, 02h          
    mov dl, bl           
    int 21h              

    ; Exit
    mov ah, 4Ch          
    int 21h              
main endp
end main
