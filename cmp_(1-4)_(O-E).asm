.model small
.stack 100h
.data
msg db 10,13,'Enter a number (1-4): $'

.code
main:
   mov ax, @data
   mov ds, ax

   lea dx, msg
   mov ah, 9
   int 21h

   mov ah, 1
   int 21h

   CMP AL, '1'
   JE ODD

   CMP AL, '3'
   JE ODD

   CMP AL, '2'
   JE EVEN

   CMP AL, '4'
   JE EVEN

   JMP END_CASE

ODD:
   MOV DL, 'o'
   JMP DISPLAY

EVEN:
   MOV DL, 'e'

DISPLAY:
   MOV AH, 2
   INT 21h

END_CASE:
   MOV AH, 4Ch
   INT 21h

end main