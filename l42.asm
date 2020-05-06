.model small
.386
 
.stack 100h
 
.data
var db 'i love (like) asm!$'
len equ $-var
 
.code
start:
mov ax,@data
mov ds,ax
mov es,ax
 
mov al,'('
lea di,var
mov cx,len
repne scasb
 
mov si,di
 
mov al,')'
repne scasb
 
mov bx,cx
 
dec si
 
cld 
mov cx,di
sub cx,si
inc cx
mov si,di
dec di
big:
push cx
push si
push di
 
mov cx,bx
shift:
lodsb
stosb
loop shift
 
mov byte ptr [di],0
 
pop di
pop si
 
dec si
dec di
 
pop cx
loop big
 
mov ah,9h
lea dx,var
int 21h 

mov ah,4Ch
mov al,00h
int 21h
end start