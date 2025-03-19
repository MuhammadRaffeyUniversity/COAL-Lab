.model small
.stack 100h
.data
var1 db "Muhammad Raffey$"
.code
main proc
    ;Write an assembly program to create a variable, save 
    ;your name as a string in the variable,and print it on the screen
    mov ax,@data
    mov ds,ax
        
    mov ah,09h
    lea dx,var1
    int 21h
    
    main endp
end main