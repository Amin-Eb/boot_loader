;[bits 16]

print_string:
	pusha
print_string_rm_loop:
	mov cl, [bx]
	cmp cl, 0
	je print_string_rm_done
	mov al, cl
	int 0x10
	add bx, 0x1
	jmp print_string_rm_loop
print_string_rm_done:
	popa
	ret