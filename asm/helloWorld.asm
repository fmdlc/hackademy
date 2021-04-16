; Compile with nasm -f elf64 -g -F DWARF  hello_world.asm
; Link with: ld -e start -o helloWorld helloWorld.o

section .data
msg: DB 'Hello World', 10
msgSize EQU $ - msg

global start

section .text
start:
	mov rax, 4     ; function 4 (_write)
	mov rbx, 1     ; stdout
	mov rcx, msg   ; msg
	mov rdx, 13    ; size
	int 0x80

	mov rax, 1     ; function 1 (_exit)
	mov rbx, 0     ; exit status
	int 0x80
	ret
