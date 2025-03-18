.model small
.stack 100h
.data
.code
main proc
    mov cx,1010010111110001b; 0A5F1h
    mov bx,1010010100100101b; 0A525h
    or cx,bx; 0A5F5h 

    mov ah,02h
    mov dx,cx
    int 21h

    mov ah,4ch
    int 21h
    main endp
end main