;((H-U+3V)modN) / (A-B-3C)modZ
.model small
.stack 256H
.data
H  dw ?
U  dw ?
V  dw ?
A  dw ?
B  dw ?
C  dw ?
Z  dw ?
N  dw ?
M  dw ?
mltp dw ?
.code
start:
mov ax,@data
mov dx,ax
mov H,3
mov U,3
mov ax,H
mov cx,U
sbb ax,cx
mov cx,ax
mov V,8
mov ax,3h
mul V
add ax,cx

mov cx,ax
mov N,-5h
mov ax,N
test ax,ax
jns next
neg ax
next:
mov N,ax
mov ax,cx
imul N
mov N,ax


mov A,7h
mov cx,A
mov B,4h
sbb cx,B
mov B,cx
mov C,8h
mov cx,ax
mov mltp,3h
mov ax,C
imul mltp
sbb B,ax
mov Z,-8h
mov ax,Z
test ax,ax
jns m2
neg ax
m2:
mov Z,ax
mov ax,B
mul Z
mov cx,ax
mov ax,N
idiv cx






int 21h
end start