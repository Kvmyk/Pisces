; -- header --
bits 64
default rel
; -- variables --
section .bss 
read_number resd 1; 64-bits int = 8 bytes
; -- constants --
section .data
read_format db "%d", 0; the format string for scanf
stringLiteral_0 db "odd", 0
stringLiteral_1 db "even", 0
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
; -- Scan -- 
	LEA rcx, read_format
	LEA rdx, read_number
	XOR eax, eax
	CALL scanf
	PUSH qword [read_number]
; -- JmpEq0 -- 
	CMP qword [rsp], 0
	JE L1
; -- Label -- 
L2:
; -- Place -- 
	PUSH 2
; -- Sub -- 
	POP rbx
	POP rax
	SUB rax, rbx
	PUSH rax
; -- JmpEq0 -- 
	CMP qword [rsp], 0
	JE L1
; -- JmpGt0 -- 
	CMP qword [rsp], 0
	JG L2
; -- Print -- 
	sub rsp, 8
	LEA rcx, stringLiteral_0
	XOR eax, eax
	CALL printf
	add rsp, 8
; -- End -- 
	JMP EXIT_LABEL
; -- Label -- 
L1:
; -- Print -- 
	sub rsp, 8
	LEA rcx, stringLiteral_1
	XOR eax, eax
	CALL printf
	add rsp, 8
; -- End -- 
	JMP EXIT_LABEL
EXIT_LABEL:
	XOR rax, rax
	CALL ExitProcess
