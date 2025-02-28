.model small
.stack 100h
.data
.code
main proc
    
    mov ah,02h
    mov dx,4dh;M
    int 21h
    
    mov dx,2eh;.
    int 21h  
    
    mov dx,52h;R
    int 21h   
    
    mov dx,61h;a
    int 21h  
    
    mov dx,66h;f
    int 21h  
    
    mov dx,66h;f
    int 21h  
     
    mov dx,65h;e
    int 21h
    
    mov dx,79h;y
    int 21h
    
    mov ah,4ch
    int 21h
    
    
    main endp
end main