.model small
.stack 100h
.data
    greet  db "Hello$"
    print db "Welcome To The  Assembly Program $"
    spc    db 10,13,"$"
.code
main proc
    mov  ax,@data
    mov  ds,ax
    call greetUser
    mov  ah,4Ch
    int  21h
main endp

greetUser proc
    lea dx,greet
    mov ah,09h
    int 21h
    
    call printName
    
    
    ret
greetUser endp

printName proc
    call spcProc
    lea dx,print
    mov ah,09h
    int 21h    

    ret
printName endp

spcProc proc
    mov dl,0ah
    mov ah,02h
    int 21h
    
    mov dl,0dh
    mov ah,02h
    int 21h
    ret
    spcProc endp
end main
