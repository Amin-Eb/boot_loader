[ org 0x7c00 ]
	mov bx , MSG_REAL_MODE
	call print_string
	mov ah, 0x06    ; Clear / scroll screen up function
	xor al, al      
	xor cx, cx      ; Row,column of window's upper left corner
	mov dx, 0x184f  ; Row,column of window's lower right corner
	mov bh, 34h
	int 0x10      
	call switch_to_pm 
	
	jmp $

%include "src/basics/print_string_rm.asm"
%include "src/basics/print_string_pm.asm"
%include "src/basics/gdt.asm"
%include "src/basics/switch_to_pm.asm"

[ bits 32]

BEGIN_PM :
	mov ebx , MSG_PROT_MODE
	call print_string_pm
	HLT
MSG_REAL_MODE db " Started in 16 - bit Real Mode " , 0
MSG_PROT_MODE db "                        ___      ___                                                                   |:::\    /:::|                                                                  |::|\\__//|::|   os 32-bit                                                      |::| \::/ |::|", 0
    

times 510 -( $ - $$ ) db 0
dw 0xaa55
