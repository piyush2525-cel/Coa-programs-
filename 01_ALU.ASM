; FILE: 01_ALU.ASM
; PRACTICAL: Arithmetic operations (ADD, SUB, MUL, DIV)
; 16-bit unsigned examples. Inspect AX, DX in a debugger after each operation.
.MODEL SMALL
.STACK 100H
.CODE
START:
    mov ax, 0020H       ; 32
    mov bx, 0005H       ; 5

    add ax, bx          ; AX = 37
    mov ax, 0020H
    sub ax, bx          ; AX = 27

    mov ax, 0020H
    mul bx              ; DX:AX = 32 * 5 = 160

    mov ax, 0020H
    xor dx, dx
    div bx              ; AX = quotient 6, DX = remainder 2

    int 3               ; breakpoint for debugger
    mov ax, 4C00H
    int 21H
END START
