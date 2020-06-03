model small
stack 256
.data
stud struc
name db 20 dup(' ')
group db 10 dup(' ')
year dw ?
stud ends
step = 32
t stud <'Andrey Shudrik $','KI-18-1 $',2>
  expan stud <>

.code

Show proc near
  
  ;  xor     bx,bx
    ;   xor     si,si
   ; mov     cx,1
   

    ;   mov     bx,si
    mov ah,09h
    lea dx,t.name[bx]
    int 21h
    ;mov ah,09h
    lea dx,t.group[bx]
    
    int 21h
    
 
    
    mov     es,bx
    xor     ax,ax
    mov     ax,t.year[bx]
    aam 
    add     ax, 3030h   
    mov     bx, ax
    mov     ah, 02   
    mov     dl, bh   
    int     21h  
    mov     dl, bl   
    int     21h 
    
    mov     dl, 10
    mov     ah, 02h
    int     21h
    ret
endp

main:
    mov ax,@data
    mov ds,ax
    call Show  
    

    int 21h
exit:
    mov ax,4c00h
    int 21h
    end main