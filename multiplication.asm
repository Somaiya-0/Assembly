.model small
.stack 100h
.data
    a db ?
    b db ?  
    result db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1      
    int 21h
    sub al,30h
    mov a,al       
    
    mov ah,2
    mov dl,10
    int 21h
    
    mov ah,1       
    int 21h
    sub al,30h
    mov b,al
    
    mov al,a
    mov bl,b        
    mul bl
    mov result,al
    
    add result,30h ; ascii
    
    mov ah,2
    mov dl,10
    int 21h
    
    mov ah,2        ;display
    mov dl,result
    int 21h
