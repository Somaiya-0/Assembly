.model small
.stack 100h
.data 
    b db "1st number : $"
    c db "2nd number : $"
    a db "sum = $"
.code
main proc
    
    mov ax,@data
    mov ds, ax
    
    mov ah, 02h
    mov dl, '?'
    int 21h
    
    mov ah, 01
    int 21h
    mov bl, al 

    mov ah,01       
    int 21h
    mov bh,al
    
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h

    lea dx, b
    mov ah,9
    int 21h

    mov ah,02
    mov dl,bl
    int 21h 

    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h

    lea dx, c
    mov ah,9
    int 21h

    mov ah,02
    mov dl,bh
    int 21h 

    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h

    add bl,bh

    lea dx, a
    mov ah,9
    int 21h
    
    mov ah,02
    sub bl, 30h
    mov dl,bl
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp
end main