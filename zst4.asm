model small
.stack 100h
.data
sym db 'pro$'
CrLf  db 0Dh, 0Ah, '$'
mesg1 db 'Enter your string: ',0dh,0ah,'$'
mesg db 'Result: ',0dh,0ah,'$'
mesgPressAnyKey db 0Dh, 0Ah, 'Press any key to exit...', '$'
Buffer label byte
MaxLen db 80
StrLen db ?
String db 81 dup(?)
.code
begin:
mov ax,@data
mov ds,ax

lea dx,[mesg1]
mov ah,09h
int 21h
mov ah,0Ah
lea dx,[Buffer]
int 21h
lea dx,[CrLf]
mov ah,09h
int 21h

mov cl,[StrLen]

lea dx,[mesg]
mov ah,09h
int 21h

mov bx,offset String
mLoop:
   mov al,[bx]
   cmp al, 'a'
   je replA
   cmp al, '1'
   je number
   cmp al, '2'
   je number
   cmp al, '3'
   je number
   cmp al, '4'
   je number
   cmp al, '5'
   je number
   jmp outputSimple 

number:
    inc bx
    loop mLoop

replA:
   lea dx, [sym]
   jmp outputPro 

outputPro:
mov ah,09h
int 21h
inc bx
jcxz Break
loop mLoop

outputSimple:
mov dl,[bx]
mov ah,02h
int 21h
inc bx
jcxz Break
loop mLoop

break:
lea dx,[mesgPressAnyKey]
mov ah,09h
int 21h
mov ah,00h
int 16h
mov ax,4C00h
int 21h
end begin