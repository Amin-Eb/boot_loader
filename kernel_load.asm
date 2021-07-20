[ org 0x7c00 ]
KERNEL_OFFSET equ 0x1000

mov [ BOOT_DRIVE ], dl 

mov bp , 0x9000
mov sp , bp

mov bx , MSG_REAL_MODE
call print_string

call load_kernel 

call switch_to_pm 

jmp $

% include "src/basics/print_string.asm"
% include " disk / disk_load.asm "
% include " pm / gdt.asm "
% include " pm / print_string_pm.asm "
% include " pm / switch_to_pm.asm "
[ bits 16]
; load_kernel
load_kernel :
mov bx , MSG_LOAD_KERNEL ; Print a message to say we are loading the kernel
call print_string
mov bx , KERNEL_OFFSET ; Set -up parameters for our disk_load routine , so
mov dh , 15 ; that we load the first 15 sectors ( excluding
mov dl , [ BOOT_DRIVE ] ; the boot sector ) from the boot disk ( i.e. our
call disk_load ; kernel code ) to address KERNEL_OFFSET
ret
[ bits 32]