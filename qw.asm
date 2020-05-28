.MODEL SMALL
.286
.STACK 256
.DATA
                            
mes0    db   13,10,'Type array:  $'
mes1    db   13,10,' Direction:  $'
mes2    db   13,10,'    Offset:  $'
mes3    db   13,10,'--------------------------'
        db   13,10,'    Result:  $'
 
array   db   9 dup(0)
direc   db   0
offs    db   0
        
.CODE                       

start:                      
        mov   ax,@data      
        mov   ds,ax         
        mov   es,ax        
        cld                 
                           
        lea   dx,mes0       
        call  message       
        mov   cx,9          
        lea   di,array      
        mov   ah,1          
save1:  int   21h          
        stosb               
        loop  save1         
 

save2:  xor   ax,ax         

        mov al, 'R'       

@@1:    
        mov   [direc],al    

save3:  xor   ax,ax         
        mov al, '1'       
        and   al,0Fh 
        mov   [offs],al     
 

        cld                 
        shl   ax,16         
        shr   bh,8          
        mov   bl,[offs]     
        lea   si,array      
        mov   di,si         
        cmp   [direc],'L'  
        je    begin         
        std                 
        add   si,8          
        mov   di,si         
 
begin:  push  di si         
        mov   cx,8          
        lodsb               
        shl   ax,8          
write:  lodsb               
        stosb               
        loop  write        
        shr   ax,8          
        stosb              
        pop   si di         
        dec   bx           
        jnz   begin         


        cld                 
        lea   dx,mes3       
        call  message       
        mov   cx,9          
        lea   si,array      
print:  lodsb               
        int   29h           
        loop  print         
 
exit:   xor   ax,ax         
        int   16h           
        ret                 

message:
   mov   ah,9
   int   21h
ret
 
end start