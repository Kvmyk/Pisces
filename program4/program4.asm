; -- header --
bits 64
default rel
; -- variables --
section .bss 
read_number resd 1; 64-bits int = 8 bytes
; -- constants --
section .data
read_format db "%d", 0; the format string for scanf
stringLiteral_0 db "Suma wynikow nie jest podzielna przez 2", 0xd,0xa, 0
stringLiteral_1 db "Suma wynikow jest podzielna przez 2", 0
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
	sub rsp, 32
	CALL scanf
	add rsp, 32
	MOV rax, qword [read_number]
	PUSH rax
; -- Scan -- 
	LEA rcx, read_format
	LEA rdx, read_number
	sub rsp, 32
	CALL scanf
	add rsp, 32
	MOV rax, qword [read_number]
	PUSH rax
; -- Add -- 
	POP rax
	ADD qword [rsp], rax
; -- JmpGt0 -- 
	CMP qword [rsp], 0
	JG L1
; -- Label -- 
L1:
; -- Place -- 
	PUSH 2
; -- Sub -- 
	POP rax
	SUB qword [rsp], rax
; -- JmpEq0 -- 
	CMP qword [rsp], 0
	JE L2
; -- JmpGt0 -- 
	CMP qword [rsp], 0
	JG L1
; -- Print -- 
	sub rsp, 8
	LEA rcx, stringLiteral_0
	XOR rax, rax
	CALL printf
	add rsp, 8
; -- End -- 
	JMP EXIT_LABEL
; -- Label -- 
L2:
; -- Print -- 
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
