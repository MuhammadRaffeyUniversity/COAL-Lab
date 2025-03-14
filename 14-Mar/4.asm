.model small
.stack 100h
.data
.code
main proc
    mov al,11110000b ;0F0h
    not al           ;0Fh
    mov ah,02h
    mov dl,al
    int 21h

    mov ah,4ch
    int 21h
    main endp
end main