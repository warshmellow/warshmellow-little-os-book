global loader                     ; the entry symbol for ELF
extern kmain

MAGIC_NUMBER  equ 0x1BADB002      ; define the magic number constant
FLAGS         equ 0x0             ; multiboot flags
CHECKSUM      equ -MAGIC_NUMBER   ; calculate the checksum
                                  ; magic num + checksum + flags should be 0

KERNEL_STACK_SIZE equ 4096

section .bss
align 4
kernel_stack:
    resb KERNEL_STACK_SIZE

section .text:                    ; start of the text
align 4                           ; the code must be 4 byte aligned    
    dd MAGIC_NUMBER               ; write the magic number
    dd FLAGS                      ; the flags
    dd CHECKSUM                   ; then the checksum

loader:                           ; entry to linker script
    mov eax, 0xCAFECAFE           ; place number 0xCAFECAFE in the register EAX
    mov esp, kernel_stack + KERNEL_STACK_SIZE
    call kmain
.loop:
    jmp .loop                     ; loop forever
