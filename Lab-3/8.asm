.model small
.stack 100h
.data
.code
main proc
    
    mov ax,'R'
    mov bx,'A'
    XCHG ax,bx 
    
    mov ah,4ch
    int 21h
    

    main endp
end main