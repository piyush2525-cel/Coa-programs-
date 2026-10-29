; FILE: 11_FLAG.ASM
; PRACTICAL: Display FLAGS register as 16 binary characters
; Output is printed using DOS character output.
.MODEL SMALL
.STACK 100H
.CODE
START:
    pushf
    pop bx              ; BX = FLAGS snapshot
    mov cx, 16
FLAG_LOOP:
    shl bx, 1
    mov dl, '0'
    jnc PRINT_BIT
    mov dl, '1'
PRINT_BIT:
    mov ah, 02H
    int 21H
    loop FLAG_LOOP

    mov dl, 13
    mov ah, 02H
    int 21H
    mov dl, 10
    mov ah, 02H
    int 21H
    mov ax, 4C00H
    int 21H
END START
