.model small
.stack 100h

.data
inpMsg  db "Enter Marks(0-9): $"
passMsg db "Pass$"
failMsg db "Fail$"
spc     db 10,13,"$"

.code
main proc
        mov  ax,@data
        mov  ds,ax
        mov  cx,3
inpLoop:
        lea  dx,inpMsg
        mov  ah,09h
        int  21h
        mov  ah,01h
        int  21h
        xor  bx,bx
        mov  bl,al
        push bx
        lea  dx,spc
        mov  ah,09h
        int  21h
        loop inpLoop
        call EvaluateScores
        mov  ah,4Ch
        int  21h
main endp

EvaluateScores proc
        push bp
        mov  bp,sp
        mov  cx,3
        mov  si,8
evalLoop:
        mov  ax,[bp+si]
        push ax
        call CheckPass
        lea  dx,spc
        mov  ah,09h
        int  21h
        sub  si,2
        loop evalLoop
        pop  bp
        ret
EvaluateScores endp

CheckPass proc
        pop  dx
        pop  ax
        push dx
        cmp  al,35h
        jl   fail
        lea  dx,passMsg
        jmp  show
fail:
        lea  dx,failMsg
show:
        mov  ah,09h
        int  21h
        ret
CheckPass endp

end main
