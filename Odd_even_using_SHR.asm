.model small
.stack 100h
.data

ev db 'Even$'
od db 'Odd$'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 1
    int 21h
    sub al, '0'

   
    shr al, 1
    jc IsOdd

    mov dx, offset ev
    mov ah, 9
    int 21h
    jmp ExitProgram

IsOdd:
    mov dx, offset od
    mov ah, 9
    int 21h

ExitProgram:
    mov ah, 4Ch
    int 21h

main endp
end main