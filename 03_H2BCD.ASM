; FILE: 03_H2BCD.ASM
; PRACTICAL: Convert hexadecimal value to packed BCD
; Input: AX = 002FH (47 decimal)
; Output: DX = 0000H, AL = 47H (packed BCD, two digits); hundreds stored separately.
.MODEL SMALL
.STACK 100H
.CODE
START:
    mov ax, 002FH       ; 47 decimal
    mov bl, 100
    div bl              ; AL = hundreds (0), AH = remainder (47)
    mov cl, al          ; hundreds digit

    mov al, ah
    xor ah, ah
    mov bl, 10
    div bl              ; AL = tens (4), AH = units (7)
    mov bh, ah          ; save units
    mov ah, al          ; tens in AH
    mov al, bh          ; units in AL
    shl ah, 4
    or  al, ah          ; AL = packed BCD 47H
    mov ah, cl          ; AH = hundreds digit (0)

    int 3
    mov ax, 4C00H
    int 21H
END START
