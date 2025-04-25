.model small
.stack 100h
.data
get_data db 'Enter Your Marks: $' ; Prompt message for marks input
spc db 10,13,'$'                  ; Newline and carriage return
pass_msg db 'Pass.$'        ; Message shown when passed
fail_msg db 'Fail.$'        ; Message shown when failed
.code
main proc
    
    mov ax,@data        ; Initialize Data Segment
    mov ds,ax           ; Set DS register to access variables
    
    xor cx,cx           ; Clear CX register (used as counter)
    
    mov cx,3            ; Set counter to loop 3 times for input
input_loop:
        mov ah,09h
        lea dx,get_data ; Load address of prompt string
        int 21h         ; Display prompt
        
        mov ah,01h
        int 21h         ; Get first digit from user
        mov bh,al       ; Store first digit (ASCII) in BH
        
        int 21h         ; Get second digit from user
        mov bl,al       ; Store second digit (ASCII) in BL
        
        push bx         ; Push both digits onto stack for later
        
        mov ah,09h
        lea dx,spc      ; Print a newline after input
        int 21h
     loop input_loop     ; Repeat for 3 inputs
     
     xor cx,cx          ; Clear CX again for result loop
     mov cx,3           ; Set loop counter for results
     
     status_loop:
        pop bx          ; Retrieve stored input from stack
        cmp bh,35h      ; Compare first digit with ASCII '5'
        jl status_fail  ; If less, then it's a fail
        cmp bl,30h      ; Compare second digit with ASCII '0'
        jge status_pass ; If greater or equal, then it's a pass

      status_fail:
        lea dx,fail_msg ; Load fail message
        mov ah,09h
        int 21h         ; Display "Fail"
        jmp done_status ; Jump to end of status check
        
      status_pass:
        lea dx,pass_msg ; Load pass message
        mov ah,09h
        int 21h         ; Display "Pass"

      done_status:
        mov ah,09h
        lea dx, spc     ; Extra newline spacing
        int 21h
     loop status_loop    ; Repeat for 3 results

     mov ah,4ch     ; Exit program
     int 21h
    
    main endp
end main
