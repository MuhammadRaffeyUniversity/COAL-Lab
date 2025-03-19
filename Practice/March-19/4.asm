.model small
.stack 100h
.data
val1 db 31h
msg db "Enter the Second Value to add in 1: $"
res db "The Sum of The Two Values is: $"
space db 10,13,"$"
.code
main proc
    ;Write an assembly program to create a variable, save one value 
    ;in it, take a second value from the user, add both values, and print the sum on the screen
    mov ax,@data
    mov ds,ax
        
    mov ah,09h
    lea dx,msg
    int 21h
    
    mov ah,01h
    int 21h
    
    mov bl,al
    sub bl,30h
    
    lea dx,space
    mov ah,09h
    int 21h
    
    mov cl,val1
    sub cl,30h
    
    add cl,bl
    add cl,30h
    
    lea dx,res
    mov ah,09h
    int 21h
    
    mov ah,02h
    mov dl,cl
    int 21h
    
    main endp
end main