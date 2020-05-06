.model small
.stack 100h
.data
num dw -4h ;????? ??? ?????????
msg_z db 'Number <0$'
 msg_p db 'Number -5 - 5$'
 msg_o db 'Number >5$'
.code
start:
mov ax, @data
mov ds, ax
mov ax, num
cmp ax,0h
jl lessThanZero
cont:
cmp ax,5h
jng checkBetweenfiveCondition
jmp biggerThanFive
jmp exit

checkBetweenfiveCondition:
mov cx,5h
cmp ax,0h
jns next
neg ax
cmp ax,cx
jng fromMinusFiveToFive
next:
cmp ax,cx
jng fromMinusFiveToFive

jmp exit


lessThanZero:
lea dx, msg_z
mov ah,9h
int 21h
jmp cont

fromMinusFiveToFive:
lea dx, msg_p
mov ah,9h
int 21h
jmp exit

biggerThanFive:
lea dx, msg_o
mov ah,9h
int 21h

exit:
end start