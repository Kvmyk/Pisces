; -- header --
bits 64
default rel
; -- variables --
section .bss 
read_number resd 1; 64-bits int = 8 bytes
; -- constants --
section .data
read_format db "%d", 0; the format string for scanf
stringLiteral_0 db "Hello World!", 0xd,0xa, 0
stringLiteral_1 db "Dzialam!", 0xd,0xa, 0
stringLiteral_2 db "Przestaje dzialac :(", 0
; -- Entry Point --
section .text
global main
extern ExitProcess
extern printf
extern scanf

main:
	PUSH rbp
	MOV rbp, rsp
	SUB rsp, 32
; -- Display -- 
	sub rsp, 32
	LEA rcx, stringLiteral_0
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Display -- 
	sub rsp, 32
	LEA rcx, stringLiteral_1
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Display -- 
	sub rsp, 32
	LEA rcx, stringLiteral_2
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- End -- 
	JMP EXIT_LABEL
EXIT_LABEL:
	XOR rax, rax
	CALL ExitProcess
