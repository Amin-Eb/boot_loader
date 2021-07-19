	mov ah, 0x02
	mov dl, 0
	mov ch, 3
	mov dh, 1
	mov cl, 4
	mov al, 5
	mov bx, 0xa000
	mov es, bx
	mov bx, 0x1234
	int 0x13

	jc disk_error

	cmp al, <no. sectors expected>
	jne disk_error
disk_error:
	mov bx, DISK_ERROR_MSG
	call print_string
	jmp $

DISK_ERROR_MSG: db "Disk Error :(", 0