; -- header --
bits 64
default rel
; -- variables --
section .bss 
read_number resq 1; 64-bits int = 8 bytes
; -- constants --
section .data
read_format db "%d", 0; the format string for scanf
stringLiteral_0 db "%d", 0xd,0xa, 0
stringLiteral_1 db "eee", 0
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
; -- Place -- 
	PUSH 3
; -- Place -- 
	PUSH 3
; -- Print -- 
	POP rdx
	sub rsp, 8
	LEA rcx, stringLiteral_0
	XOR rax, rax
	CALL printf
	add rsp, 8
; -- Place -- 
	PUSH 3
; -- Add -- 
	POP rax
	ADD qword [rsp], rax
; -- Print -- 
	POP rdx
	sub rsp, 8
	LEA rcx, stringLiteral_1
	XOR rax, rax
	CALL printf
	add rsp, 8
; -- End -- 
	JMP EXIT_LABEL
EXIT_LABEL:
	XOR rax, rax
	CALL ExitProcess
