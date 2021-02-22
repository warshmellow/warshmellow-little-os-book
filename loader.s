global loader                     ; the entry symbol for ELF

MAGIC_NUMBER  equ 0x1BADB002      ; define the magic number constant
FLAGS         equ 0x0             ; multiboot flags
CHECKSUM      equ -MAGIC_NUMBER   ; calculate the checksum
                                  ; magic num + checksum + flags should be 0

section .text:                    ; start of the text
align 4
    dd MAGIC_NUMBER
    dd FLAGS
    dd CHECKSUM

loader:
    mov eax, 0xCAFECAFE
.loop:
    jmp .loop
