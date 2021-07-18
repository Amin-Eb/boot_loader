gdt_start :

gdt_null : 
	dd 0 x0 
	dd 0 x0
	
	
gdt_code :
	dw 0 xffff 
	dw 0 x0 
	db 0 x0 
	db 10011010 b 
	db 11001111 b 
	db 0 x0 
	
	
gdt_data : 
	dw 0 xffff 
	dw 0 x0 
	db 0 x0 
	db 10010010 b 
	db 11001111 b 
	db 0 x0 

gdt_end :

gdt_descriptor :
	dw gdt_end - gdt_start - 1 
	dd gdt_start 


CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start