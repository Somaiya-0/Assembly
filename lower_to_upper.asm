.model small
.stack 100h
.code

    mov ah,1   ;input
    int 21h
    sub al,32
    mov bl,al
    
    mov ah,2    ;newline
    mov dl,10
    int 21h
    
    mov dl,13    ;cret
    int 21h
    
    mov ah,2     ;output
    mov dl,bl
    int 21h