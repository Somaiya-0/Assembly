.model small
.stack 100h
.data
    a db ?
    .code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,1       ;first number
        int 21h
        mov bl,al 
        
        mov ah,2
        mov dl,10
        int 21h
        
        mov ah,1        ;second number
        int 21h
        mov a,al
        
        sub bl,a          ;sub  
        
        mov ah,2
        mov dl,10
        int 21h
        
        mov ah,2          ;display
        add bl,30h
        mov dl,bl
        int 21h
        