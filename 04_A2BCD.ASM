; FILE: 04_A2BCD.ASM
; PRACTICAL: Convert two ASCII digits to packed BCD
; Input characters: '4' and '7'
; Output: AL = 47H (packed BCD)
.MODEL SMALL
.STACK 100H
.CODE
START:
    mov al, '4'
    sub al, '0'         ; AL = 04H
    shl al, 4           ; tens nibble
    mov bl, '7'
    sub bl, '0'         ; BL = 07H
    or  al, bl          ; AL = 47H packed BCD

    int 3
    mov ax, 4C00H
    int 21H
END START
