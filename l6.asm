model small
stack 256
.data
tv struc
names db 10 dup(' ')
prc dw ?
serie dw ?
tv ends
step = 14
t tv <'A$',4,8>
  tv <'B$',6,5>
  tv <'C$',1,3>
  tv <'D$',17,2>
  expan tv <>
mx dw ?
.code

Show proc near
 xor     bx,bx
    xor     si,si
   mov bx,si
   mov ax, t.prc[bx]
   mov mx,ax
   
    xor     bx,bx
    xor     si,si
    mov     cx,4
   
    loop1:
    mov     bx,si
    mov ah,09h
    lea dx,t.names[bx]
    int 21h
    
    mov ax,t.prc[bx]
    cmp ax,mx
    jna next
    mov ax, t.prc[bx]
    mov mx,ax
    next:
    add     si, step
    loop    loop1
    ret
endp

main:
    mov ax,@data
    mov ds,ax
    call Show  
    
    mov ah,09h
    lea dx,mx
    int 21h
exit:
    mov ax,4c00h
    int 21h
    end main