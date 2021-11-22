bits 16

org 0x7c00

mov ah, 0x06    ; Clear / scroll screen up function
xor al, al      ; Number of lines by which to scroll up (00h = clear entire window)
xor cx, cx      ; Row,column of window's upper left corner
mov dx, 0x184f  ; Row,column of window's lower right corner
mov bh, 0x4e    ; Background/foreground colour. In our case - red background / yellow foreground (https://en.wikipedia.org/wiki/BIOS_color_attributes)
int 0x10        ; Issue BIOS video services interrupt with function 0x06
mov si, bootloaderBanner
loop:
	lodsb
	test al, al
	jz end
	mov ah, 00h
	int 16h
	jmp loop
end:
	hlt
; Move label's bootloaderBanner memory address to si
mov si, bootloaderBanner
; Put 0x0e to ah, which stands for "Write Character in TTY mode" when issuing a BIOS Video Services interrupt 0x10
mov ah, 0x0e
loop1:
    ; Load byte at address si to al
    lodsb
    ; Check if al==0 / a NULL byte, meaning end of a C string
    test al, al
    ; If al==0, jump to end, where the bootloader will be halted
    jz end1
    ; Issue a BIOS interrupt 0x10 for video services
    int 0x10                                                
    ; Repeat
    jmp loop1
end1:
    ; Halt the program until the next interrupt
    hlt
bootloaderBanner: db "salam",0

txt: db "s"

times 510 - ($-$$) db 0
; Bootloader magic number
dw 0xaa55         