; FILE: 07_XCHG.ASM
; PRACTICAL: Exchange 8 bytes between DS:1000H and DS:2000H
; Source/destination memory should be initialized in a debugger.
.MODEL SMALL
.STACK 100H
.CODE
START:
    mov ax, 5000H
    mov ds, ax
    mov si, 1000H
    mov di, 2000H
    mov cx, 8
EXCHANGE_LOOP:
    mov al, [si]
    xchg al, [di]
    mov [si], al
    inc si
    inc di
    loop EXCHANGE_LOOP

    int 3
    mov ax, 4C00H
    int 21H
END START
