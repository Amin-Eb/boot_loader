my_print_function :
	mov ah, 0x0e 
	int 0x10 ; print the character in al
	ret