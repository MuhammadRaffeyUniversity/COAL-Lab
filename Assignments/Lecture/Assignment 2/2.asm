.MODEL SMALL
.STACK 100H
.DATA
msgPrompt  db  'Enter a sentence (up to 50 chars): $'
msgResult  db  0Dh,0Ah,'Number of words: $'
newLine    db  0Dh,0Ah,'$'
userInput  db  50 dup (?)
wordCount  db  0
.CODE
MAIN PROC
    mov ax, @DATA
    mov ds, ax

    lea dx, msgPrompt
    mov ah, 09h
    int 21h

    mov cx, 50
    lea bx, userInput
read_loop:
    mov ah, 01h
    int 21h
    cmp al, 0Dh
    je end_read
    mov [bx], al
    inc bx
    loop read_loop
end_read:
    mov al, 0
    mov [bx], al

    mov wordCount, 0
    lea bx, userInput
    mov ah, 0
count_loop:
    mov al, [bx]
    cmp al, 0
    je done_count
    cmp al, ' '
    je delimiter
    cmp al, ','
    je delimiter
    cmp al, '.'
    je delimiter
    cmp ah, 0
    jne skip
    mov ah, 1
    inc wordCount
skip:
    jmp move_next
delimiter:
    mov ah, 0
move_next:
    inc bx
    jmp count_loop
done_count:
    lea dx, msgResult
    mov ah, 09h
    int 21h
    mov ax, 0
    mov al, wordCount
    mov bl, 10
    mov cx, 0
dec_loop:
    cmp al, 0
    je print_digits
    div bl
    mov dl, ah
    mov ah, 0
    add dl, '0'
    push dx
    inc cx
    jmp dec_loop
print_digits:
    cmp cx, 0
    jne print_loop
    mov dl, '0'
    mov ah, 02h
    int 21h
    jmp done_print
print_loop:
    pop dx
    mov ah, 02h
    int 21h
    loop print_loop
done_print:
    lea dx, newLine
    mov ah, 09h
    int 21h
    mov ah, 4Ch
    int 21h
MAIN ENDP
END MAIN
