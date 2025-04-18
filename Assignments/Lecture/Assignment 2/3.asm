.MODEL SMALL
.STACK 100H
.DATA
msgPrompt   db  'Enter a phrase (up to 30 chars): $'
msgVowels   db  0Dh,0Ah, 'Number of vowels: $'
msgCons     db  0Dh,0Ah, 'Number of consonants: $'
newLine     db  0Dh,0Ah, '$'
userInput   db  30 dup (?)
vowCount    db  0
consCount   db  0
.CODE
MAIN PROC
    mov ax, @DATA
    mov ds, ax

    lea dx, msgPrompt
    mov ah, 09h
    int 21h

    mov cx, 30
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

    mov vowCount, 0
    mov consCount, 0
    lea bx, userInput
count_loop:
    mov al, [bx]
    cmp al, 0
    je done_count
    cmp al, 'a'
    jb skip_case_convert
    cmp al, 'z'
    ja skip_case_convert
    sub al, 20h
skip_case_convert:
    cmp al, 'A'
    jb next_char
    cmp al, 'Z'
    ja next_char
    cmp al, 'A'
    je is_vowel
    cmp al, 'E'
    je is_vowel
    cmp al, 'I'
    je is_vowel
    cmp al, 'O'
    je is_vowel
    cmp al, 'U'
    je is_vowel
    inc consCount
    jmp next_char
is_vowel:
    inc vowCount
next_char:
    inc bx
    jmp count_loop

done_count:
    lea dx, msgVowels
    mov ah, 09h
    int 21h

    mov ax, 0
    mov al, vowCount
    mov bl, 10
    mov cx, 0
vow_loop:
    cmp al, 0
    je vow_print_digits
    div bl
    mov dl, ah
    mov ah, 0
    add dl, '0'
    push dx
    inc cx
    jmp vow_loop
vow_print_digits:
    cmp cx, 0
    jne vow_pop
    mov dl, '0'
    mov ah, 02h
    int 21h
    jmp vow_done
vow_pop:
    pop dx
    mov ah, 02h
    int 21h
    loop vow_pop
vow_done:

    lea dx, msgCons
    mov ah, 09h
    int 21h

    mov ax, 0
    mov al, consCount
    mov bl, 10
    mov cx, 0
cons_loop:
    cmp al, 0
    je cons_print_digits
    div bl
    mov dl, ah
    mov ah, 0
    add dl, '0'
    push dx
    inc cx
    jmp cons_loop
cons_print_digits:
    cmp cx, 0
    jne cons_pop
    mov dl, '0'
    mov ah, 02h
    int 21h
    jmp cons_done
cons_pop:
    pop dx
    mov ah, 02h
    int 21h
    loop cons_pop
cons_done:

    lea dx, newLine
    mov ah, 09h
    int 21h

    mov ah, 4Ch
    int 21h
MAIN ENDP
END MAIN