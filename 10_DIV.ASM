; FILE: 10_DIV.ASM
; PRACTICAL: Restoring division (unsigned 8-bit)
; Sample: dividend 7, divisor 3. Result AL = quotient 2, AH = remainder 1.
.MODEL SMALL
.STACK 100H
.CODE
START:
    mov al, 7             ; dividend / quotient register
    mov bl, 3             ; divisor
    mov ah, 0             ; remainder register
    mov cl, 8
DIV_LOOP:
    shl ax, 1             ; shift next dividend bit into remainder
    cmp ah, bl
    jb  NEXT_BIT
    sub ah, bl
    or  al, 1
NEXT_BIT:
    dec cl
    jnz DIV_LOOP

    int 3
    mov ax, 4C00H
    int 21H
END START
