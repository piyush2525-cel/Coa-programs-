; FILE: 08_FILE.ASM
; PRACTICAL: DOS file operations: create, write, close, open, read, close
; Creates A.TXT containing HELLO, then reads it into BUF.
.MODEL SMALL
.STACK 100H
.DATA
    FNAME DB 'A.TXT',0
    MSG   DB 'HELLO'
    BUF   DB 5 DUP(?)
    HANDLE DW ?
.CODE
START:
    mov ax, @DATA
    mov ds, ax

    ; Create/truncate file (INT 21h, AH=3Ch)
    mov ah, 3Ch
    xor cx, cx
    lea dx, FNAME
    int 21h
    jc  EXIT
    mov HANDLE, ax

    ; Write five bytes
    mov bx, HANDLE
    mov ah, 40h
    mov cx, 5
    lea dx, MSG
    int 21h

    ; Close file
    mov bx, HANDLE
    mov ah, 3Eh
    int 21h

    ; Open file read-only
    mov ah, 3Dh
    xor al, al
    lea dx, FNAME
    int 21h
    jc  EXIT
    mov HANDLE, ax

    ; Read five bytes
    mov bx, HANDLE
    mov ah, 3Fh
    mov cx, 5
    lea dx, BUF
    int 21h

    ; Close file
    mov bx, HANDLE
    mov ah, 3Eh
    int 21h

EXIT:
    mov ax, 4C00H
    int 21H
END START
