.model small
.stack 100h
.data
.code
main proc
    
    mov ah,02h
        
    mov dx,52h;R
    int 21h   
    
    mov dx,41h;A
    int 21h  
    
    mov dx,46h;F
    int 21h  
    
    mov dx,46h;F
    int 21h  
     
    mov dx,45h;E
    int 21h
    
    mov dx,59h;Y
    int 21h
    
    mov ah,4ch
    int 21h
    
    
    main endp
end main