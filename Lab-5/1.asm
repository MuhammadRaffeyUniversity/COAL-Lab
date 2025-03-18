.model small
.stack 100h
.data
.code
main proc
    mov al,11110001b ;0F1h
    mov bl,10100101b ;0A5h
    and al,bl ;0A1h

    mov ah,02h
    mov dl,al
    int 21h

    mov ah,4ch
    int 21h

    main endp
end main