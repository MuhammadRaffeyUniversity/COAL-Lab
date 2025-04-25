.model small
.stack 100h
.data
.code
main proc
    mov ax ,@data
    mov ds,ax
    
    mov dl,41h
    mov ah,02h
    int 21h
    
    call myProc 
    
    mov dl,42h
    mov ah,02h
    int 21h
    
   
    mov ah,4ch
    int 21h
    
    main endp

myProc proc
    mov dl,0ah
    mov ah,02h
    int 21h
    
    mov dl,0dh
    mov ah,02h
    int 21h
    ret
    myProc endp
end main 