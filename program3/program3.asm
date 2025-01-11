; -- header --
bits 64
default rel
; -- variables --
section .bss 
read_number resd 1; 64-bits int = 8 bytes
; -- constants --
section .data
read_format db "%d", 0; the format string for scanf
stringLiteral_0 db "Negative", 0xd,0xa, 0
stringLiteral_1 db "Not divisible by 999", 0xd,0xa, 0
stringLiteral_2 db "Divisible by 999", 0xd,0xa, 0
stringLiteral_3 db "Zero", 0
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
; -- JmpEq0 -- 
	CMP qword [rsp], 0
	JE L2
; -- JmpGt0 -- 
	CMP qword [rsp], 0
	JG L0
; -- Print -- 
	sub rsp, 8
	LEA rcx, stringLiteral_0
	XOR rax, rax
	CALL printf
	add rsp, 8
; -- End -- 
	JMP EXIT_LABEL
; -- Label -- 
L0:
; -- Place -- 
	PUSH 999
; -- Sub -- 
	POP rax
	SUB qword [rsp], rax
; -- JmpEq0 -- 
	CMP qword [rsp], 0
	JE L1
; -- JmpGt0 -- 
	CMP qword [rsp], 0
	JG L0
; -- Print -- 
	sub rsp, 8
	LEA rcx, stringLiteral_1
	XOR rax, rax
	CALL printf
	add rsp, 8
; -- End -- 
	JMP EXIT_LABEL
; -- Label -- 
L1:
; -- Print -- 
	sub rsp, 8
	LEA rcx, stringLiteral_2
	XOR rax, rax
	CALL printf
	add rsp, 8
; -- End -- 
	JMP EXIT_LABEL
; -- Label -- 
L2:
; -- Print -- 
	sub rsp, 8
	LEA rcx, stringLiteral_3
	XOR rax, rax
	CALL printf
	add rsp, 8
; -- End -- 
	JMP EXIT_LABEL
EXIT_LABEL:
	XOR rax, rax
	CALL ExitProcess
