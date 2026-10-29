; FILE: 05_B2ASC.ASM
; PRACTICAL: Convert packed BCD to ASCII digits
; Input: AL = 47H (packed BCD)
; Output: DL = '4', DH = '7'
.MODEL SMALL
.STACK 100H
.CODE
START:
    mov al, 47H
    mov ah, al
    and al, 0FH         ; units nibble
    add al, '0'
    mov dl, al          ; ASCII units

    mov al, ah
    and al, 0F0H        ; tens nibble
    shr al, 4
    add al, '0'
    mov dh, al          ; ASCII tens

    int 3
    mov ax, 4C00H
    int 21H
END START
