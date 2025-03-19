.model small
.stack 100h
.data
val1 db ?
val2 db ?
msg1 db "Enter the First Value: $"
msg2 db "Enter the Second Value: $"
res db "The Subtraction of The Two Values is: $"
space db 10,13,"$"
.code
main proc
    mov ax,@data
    mov ds,ax
        
    mov ah,09h
    lea dx,msg1
    int 21h
    
    mov ah,01h
    int 21h
    
    mov val1,al
    
    lea dx,space
    mov ah,09h
    int 21h
    
    lea dx,msg2
    int 21h
    
    mov ah,01h
    int 21h
    
    mov val2,al
    
    lea dx,space
    mov ah,09h
    int 21h
    
    mov bl,val1
    sub bl,30h
    
    mov cl,val2
    sub cl,30h
    
    sub bl,cl
    add bl,30h
    
    lea dx,res
    mov ah,09h
    int 21h
    
    mov ah,02h
    mov dl,bl
    int 21h
    
    main endp
end main