.model small
.stack 100h
.data
    a db ?               ; Variable to store the first number
    b db ?               ; Variable to store the second number
    result db ?          ; Variable to store the multiplication result
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Read first number
    mov ah, 1           
    int 21h             
    sub al, 30h         
    mov a, al           

    ; New line
    mov ah, 2           
    mov dl, 10          
    int 21h             
    mov dl, 13          
    int 21h             

    ; Read second number
    mov ah, 1           
    int 21h             
    sub al, 30h         
    mov b, al           

    ; Multiply
    mov al, a           
    mov bl, b           
    mul bl               ; AL = AL * BL
    mov result, al      ; Store the result

    ; Convert result to ASCII
    add result, 30h     

    ; New line
    mov ah, 2           
    mov dl, 10          
    int 21h             
    mov dl, 13          
    int 21h             

    ; Display result
    mov ah, 2           
    mov dl, result      
    int 21h             

    ; Exit
    mov ah, 4Ch         
    int 21h             
main endp
end main
