; FILE: 06_TRANS.ASM
; PRACTICAL: Block transfer of 8 bytes from DS:1000H to DS:2000H
; In DOSBox/debugger, set the source bytes at DS:1000H before running.
.MODEL SMALL
.STACK 100H
.CODE
START:
    mov ax, 5000H
    mov ds, ax
    mov es, ax
    cld
    mov si, 1000H
    mov di, 2000H
    mov cx, 8
    rep movsb           ; copy DS:SI to ES:DI

    int 3
    mov ax, 4C00H
    int 21H
END START
