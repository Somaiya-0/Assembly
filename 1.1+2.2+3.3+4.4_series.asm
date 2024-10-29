org 100h
.DATA
    N dw 5            ; Number of terms
    Sum dw 0          ; Variable to store the sum of squares
.CODE
MAIN:
    mov cx, N         ; Set loop counter to N (5)
    xor bx, bx        ; Clear bx (we will use bx for the number)

Sumloop:  
    inc bx            ; Increment bx (start from 1)
    mov ax, bx        ; Move current value of bx to ax
    mul bx            ; AX = BX * BX (square the number)
    add [Sum], ax     ; Add squared value to Sum
    loop Sumloop      ; Loop until CX = 0

    ; Prepare to exit
    mov ax, [Sum]      ; Move final sum into AX

    ; Terminate program
    mov ah, 4ch
    int 21h

END MAIN