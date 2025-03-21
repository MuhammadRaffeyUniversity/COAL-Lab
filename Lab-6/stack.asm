.model small
.stack 100h
; stack is used when you need to store some value temp
;sp->stack pointer:points at the top of the stack
;bp->base pointer: points at the base of the stack
;push command is used to store some value in stack 
;ah->has 5 saved push ah will push 5 in stack
;pop->is used to get a value from stack  pop ah; saves the first value (top value of stack) in ah
;pushf
;popf
.data

.code
main proc    
    mov ax,3
    mov bx,4
    
    push ax
    push bx
    
    pop ax
    pop bx

    

main endp
end main
