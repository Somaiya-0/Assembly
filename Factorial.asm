org 100h            ; Set origin for the program

.DATA
    N dw 5          ; Number of terms (5)
    Factorial dw 0  ; Variable to store the factorial result

.CODE
MAIN:
    mov cx, N      ; Set loop counter (CX) to N (5)
    mov ax, 1      ; Initialize AX to 1 (factorial start)
    mov bx, 1      ; Initialize BX to 1 (first multiplier)

FactorialLoop:  
    mul bx         ; Multiply AX by BX (calculate factorial)
    inc bx         ; Increment BX to the next number
    loop FactorialLoop ; Repeat until CX reaches 0

    ; Store final factorial result
    mov [Factorial], ax ; Move result from AX to Factorial

    ; Terminate program
    mov ah, 4ch    ; Set function for program termination
    int 21h        ; Call DOS interrupt to exit

END MAIN             ; End of the program
