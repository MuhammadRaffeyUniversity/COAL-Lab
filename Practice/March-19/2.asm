.model small
.stack 100h
.data
var1 db 10,13,"$"
.code
main proc
    ;Write an assembly program that takes a uppercase alphabet 
    ;from the user and prints the corresponding lowercase letter.
    mov ax,@data
    mov ds,ax
    
    mov ah,01h
    int 21h
    mov bl,al
    
    add bl,20h
    
    mov ah,09h
    lea dx,var1
    int 21h
    
    mov ah,02h
    mov dl,bl
    int 21h
    
    main endp
end main