.model small
.stack 100h
.data
    inMsg  db "Enter a Number: $"
    outMsg db "The Sum is: $"
    spc    db 10,13,"$"
.code
main proc
    mov  ax,@data
    mov  ds,ax

    xor  bx,bx

    call inputProc
    mov  bh,al      
    
    call spcProc
    
    call inputProc
    mov  bl,al      
    
    call spcProc
    
    call addProc

    mov  ah,4Ch
    int  21h
main endp

inputProc proc
    lea  dx,inMsg
    mov  ah,09h
    int  21h

    mov  ah,01h
    int  21h       

    sub  al,30h   
    ret
inputProc endp

addProc proc
    mov  ah,09h
    lea  dx,spc
    int  21h       

    add  bl,bh      
    add  bl,30h     
    mov  dl,bl
    mov  ah,02h
    int  21h       

    ret
addProc endp

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
