;c =(z*B+3) /(f-s)
.model small
.stack 256H
.data
c dw ?
z dw ?
b dw ?
f dw ?
s dw ?
.code
start:
mov ax,@data
mov dx,ax
mov z,4h
mov b,8h
mov ax,z
mul b ; c=z*b
mov c,ax
add c,3h ;c+=3
mov ax,c 

mov f,5h
mov s,9h
mov cx ,f
sbb cx,s ;cx = f-s

idiv cx ;ax = c/cx

end start