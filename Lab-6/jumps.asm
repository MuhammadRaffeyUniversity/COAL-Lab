.model small
.stack 100h

.data
msg_greater db 'AL is greater than BL$',13,10
msg_less    db 'AL is less than BL$',13,10
msg_equal   db 'AL is equal to BL$',13,10

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, 5
    mov bl, 7
    cmp al, bl

    jg greater
    jl less
    je equal

greater:
    lea dx, msg_greater
    jmp display

less:
    lea dx, msg_less
    jmp display

equal:
    lea dx, msg_equal


display:
    mov ah, 09h
    int 21h

exit:
    mov ax, 04ch
    int 21h

main endp
end main
