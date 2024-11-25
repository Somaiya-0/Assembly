.model small
.stack 100h
.data
    topBorder db '================================================', 13, 10, '$'
    welcomeMessage db '||  Welcome to Text to Morse Code Translator  ||', 13, 10, '$'
    bottomBorder db '================================================', 13, 10, '$'
    promptMessage db 'Enter text in English to translate: ', '$'
    morseOutput db 13, 10, 'Morse Code Version: ', '$'
    inputString db 15          ; Buffer size for input (14 characters + null terminator)
    db ?                        ; Number of characters entered (initially 0)
    db 15 dup('$')              ; Reserve space for the input (25 bytes, terminated by '$')
    morseA db '.- ', '$'
    morseB db '-... ', '$'
    morseC db '-.-. ', '$'
    morseD db '-.. ', '$'
    morseE db '. ', '$'
    morseF db '..-. ', '$'
    morseG db '--. ', '$'
    morseH db '.... ', '$'
    morseI db '.. ', '$'
    morseJ db '.--- ', '$'
    morseK db '-.- ', '$'
    morseL db '.-.. ', '$'
    morseM db '-- ', '$'
    morseN db '-. ', '$'
    morseO db '--- ', '$'
    morseP db '.--. ', '$'
    morseQ db '--.- ', '$'
    morseR db '.-. ', '$'
    morseS db '... ', '$'
    morseT db '- ', '$'
    morseU db '..- ', '$'
    morseV db '...- ', '$'
    morseW db '.-- ', '$'
    morseX db '-..- ', '$'
    morseY db '-.-- ', '$'
    morseZ db '--.. ', '$'
    space db '/ ', '$'      ; Change to '/' instead of a space
    newline db 13, 10, '$'      ; Newline characters (CR + LF)

.code
main:
    mov ax, @data
    mov ds, ax
    
    ; Display top border
    mov dx, offset topBorder
    call print_string

    ; Display welcome message
    mov dx, offset welcomeMessage
    call print_string
    
    ; Display bottom border
    mov dx, offset bottomBorder
    call print_string
    
    ; Display prompt message
    mov dx, offset promptMessage
    call print_string

    ; Get user input
    mov ah, 0Ah             ; Function to input string
    lea dx, inputString
    int 21h

    ; Display morse output message
    mov dx, offset morseOutput
    call print_string

    ; Point to the input string (first character entered)
    lea si, inputString+2    ; Skip buffer size and number of characters

next_char:
    ; Get the next character
    lodsb
    cmp al, '$'              ; End of input string (manually added '$')
    je print_newline

    ; Check if the character is a lowercase letter
    cmp al, 'a'              ; If 'a' <= AL <= 'z'
    jb not_lowercase
    cmp al, 'z'
    ja not_lowercase
    sub al, 20h              ; Convert to uppercase (ASCII difference)
not_lowercase:

    ; Check if the character is uppercase (A-Z)
    cmp al, 'A'              
    jb skip_char
    cmp al, 'Z'
    ja skip_char

    ; Find Morse code for character
    call print_morse

skip_char:
    cmp al, ' '              ; Check for space (word separator)
    jne next_char
    
    ; Print '/' between words
    mov dx, offset space
    call print_string
    jmp next_char


print_morse:
    ; Print Morse code corresponding to character in AL
    cmp al, 'A'
    je print_morseA
    cmp al, 'B'
    je print_morseB                                      
    cmp al, 'C'
    je print_morseC
    cmp al, 'D'
    je print_morseD
    cmp al, 'E'
    je print_morseE
    cmp al, 'F'
    je print_morseF
    cmp al, 'G'
    je print_morseG
    cmp al, 'H'
    je print_morseH
    cmp al, 'I'
    je print_morseI
    cmp al, 'J'
    je print_morseJ
    cmp al, 'K'
    je print_morseK
    cmp al, 'L'
    je print_morseL
    cmp al, 'M'
    je print_morseM
    cmp al, 'N'
    je print_morseN
    cmp al, 'O'
    je print_morseO
    cmp al, 'P'
    je print_morseP
    cmp al, 'Q'
    je print_morseQ
    cmp al, 'R'
    je print_morseR
    cmp al, 'S'
    je print_morseS
    cmp al, 'T'
    je print_morseT
    cmp al, 'U'
    je print_morseU
    cmp al, 'V'
    je print_morseV
    cmp al, 'W'
    je print_morseW
    cmp al, 'X'
    je print_morseX
    cmp al, 'Y'
    je print_morseY
    cmp al, 'Z'
    je print_morseZ
    ret

print_morseA: mov dx, offset morseA ; Print Morse for 'A'
    jmp print_string
print_morseB: mov dx, offset morseB ; Print Morse for 'B'
    jmp print_string
print_morseC: mov dx, offset morseC ; Print Morse for 'C'
    jmp print_string
print_morseD: mov dx, offset morseD ; Print Morse for 'D'
    jmp print_string
print_morseE: mov dx, offset morseE ; Print Morse for 'E'
    jmp print_string
print_morseF: mov dx, offset morseF ; Print Morse for 'F'
    jmp print_string
print_morseG: mov dx, offset morseG ; Print Morse for 'G'
    jmp print_string
print_morseH: mov dx, offset morseH ; Print Morse for 'H'
    jmp print_string
print_morseI: mov dx, offset morseI ; Print Morse for 'I'
    jmp print_string
print_morseJ: mov dx, offset morseJ ; Print Morse for 'J'
    jmp print_string
print_morseK: mov dx, offset morseK ; Print Morse for 'K'
    jmp print_string
print_morseL: mov dx, offset morseL ; Print Morse for 'L'
    jmp print_string
print_morseM: mov dx, offset morseM ; Print Morse for 'M'
    jmp print_string
print_morseN: mov dx, offset morseN ; Print Morse for 'N'
    jmp print_string
print_morseO: mov dx, offset morseO ; Print Morse for 'O'
    jmp print_string
print_morseP: mov dx, offset morseP ; Print Morse for 'P'
    jmp print_string
print_morseQ: mov dx, offset morseQ ; Print Morse for 'Q'
    jmp print_string
print_morseR: mov dx, offset morseR ; Print Morse for 'R'
    jmp print_string
print_morseS: mov dx, offset morseS ; Print Morse for 'S'
    jmp print_string
print_morseT: mov dx, offset morseT ; Print Morse for 'T'
    jmp print_string
print_morseU: mov dx, offset morseU ; Print Morse for 'U'
    jmp print_string
print_morseV: mov dx, offset morseV ; Print Morse for 'V'
    jmp print_string
print_morseW: mov dx, offset morseW ; Print Morse for 'W'
    jmp print_string
print_morseX: mov dx, offset morseX ; Print Morse for 'X'
    jmp print_string
print_morseY: mov dx, offset morseY ; Print Morse for 'Y'
    jmp print_string
print_morseZ: mov dx, offset morseZ ; Print Morse for 'Z'
    jmp print_string

print_string:
    ; Print string at DX (terminated by '$')
    mov ah, 09h         ; INT 21h, AH=09h (print string)
    int 21h
    ret

print_newline:
    ; Print newline after the input
    mov dx, offset newline
    call print_string
    jmp end_program

end_program:
    ; Terminate program
    mov ah, 4Ch
    int 21h
