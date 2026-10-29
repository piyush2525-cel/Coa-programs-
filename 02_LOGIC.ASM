; FILE: 02_LOGIC.ASM
; PRACTICAL: Logical operations (AND, OR, XOR, NOT)
; Inspect AL after each operation in a debugger.
.MODEL SMALL
.STACK 100H
.CODE
START:
    mov al, 0AAH
    mov bl, 55H
    and al, bl          ; AL = 00H

    mov al, 0AAH
    or  al, bl          ; AL = FFH

    mov al, 0AAH
    xor al, bl          ; AL = FFH

    mov al, 0AAH
    not al              ; AL = 55H

    int 3
    mov ax, 4C00H
    int 21H
END START
