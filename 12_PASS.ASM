; FILE: 12_PASS.ASM
; PRACTICAL: Password detection
; Expected password: 1234. User input is compared character by character.
.MODEL SMALL
.STACK 100H
.DATA
    PROMPT DB 'Enter password: $'
    OKMSG  DB 13,10,'MATCH$'
    BADMSG DB 13,10,'WRONG$'
    PASSWD DB '1234'
.CODE
START:
    mov ax, @DATA
    mov ds, ax

    mov ah, 09H
    lea dx, PROMPT
    int 21H

    lea si, PASSWD
    mov cx, 4
CHECK_CHAR:
    mov ah, 08H         ; read character without echo
    int 21H
    cmp al, [si]
    jne WRONG
    inc si
    loop CHECK_CHAR

    mov ah, 09H
    lea dx, OKMSG
    int 21H
    jmp EXIT

WRONG:
    mov ah, 09H
    lea dx, BADMSG
    int 21H

EXIT:
    mov ax, 4C00H
    int 21H
END START
