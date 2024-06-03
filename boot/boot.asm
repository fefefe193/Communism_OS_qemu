[ORG 0x7C00]
mov ah, 0x0E
mov al, '>'
int 0x10

mov si, boot_message
call print_string

jmp $

boot_message db 'Hello Communist', 0

print_string:
    lodsb
    cmp al, 0
    je done
    mov ah, 0x0E
    int 0x10
    jmp print_string
done:
    ret

times 510 - ($-$$) db 0
dw 0xAA55
