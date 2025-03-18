.model small
.stack 100h
.data
.code
main proc
    mov ah,02h

    mov dx,82d
    int 21h
    
    mov ax,4ch
    int 21h

    main endp
end main