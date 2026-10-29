; FILE: 09_BOOTH.ASM
; PRACTICAL: Booth's multiplication for signed 8-bit numbers
; Sample: 5 * -3 = -15. Final signed 16-bit product is in AX (A:Q).
.MODEL SMALL
.STACK 100H
.DATA
    M       DB 5
    A       DB 0
    Q       DB -3
    Q_MINUS DB 0
.CODE
START:
    mov ax, @DATA
    mov ds, ax
    mov byte ptr A, 0
    mov byte ptr Q_MINUS, 0
    mov cx, 8

BOOTH_LOOP:
    mov al, Q
    and al, 1             ; Q0
    cmp al, Q_MINUS
    je  SHIFT_COMBINED    ; 00 or 11: no arithmetic operation
    cmp al, 0
    je  SUB_MULTIPLICAND  ; Q0,Q-1 = 01? Q0=0 and Q-1=1 => A = A - M
    ; Q0=1 and Q-1=0 => A = A + M
    mov al, A
    add al, M
    mov A, al
    jmp SHIFT_COMBINED

SUB_MULTIPLICAND:
    mov al, A
    sub al, M
    mov A, al

SHIFT_COMBINED:
    ; Arithmetic right shift of A:Q:Q-1
    mov al, A
    sar al, 1
    mov A, al             ; CF = old A bit 0

    mov al, Q
    rcr al, 1             ; old A bit 0 enters Q bit 7; CF = old Q bit 0
    mov Q, al

    mov al, 0
    adc al, 0             ; AL = old Q bit 0
    mov Q_MINUS, al
    loop BOOTH_LOOP

    ; Product is signed 16-bit A:Q
    mov ah, A
    mov al, Q
    int 3
    mov ax, 4C00H
    int 21H
END START
