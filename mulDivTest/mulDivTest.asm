; -- header --
bits 64
default rel
; -- variables --
section .bss 
read_number resq 1; 64-bits int = 8 bytes
; -- constants --
section .data
read_format db "%d", 0; the format string for scanf
printNumberFormat db "%lld", 0xd, 0xa, 0
stringLiteral_0 db "Iloczyn Twoich nie jest podzielny przez 2", 0xd,0xa, 0
stringLiteral_1 db "Iloczyn Twoich liczb jest podzielny przez 2", 0
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
; -- Mul -- 
	POP rax
	IMUL rax, qword [rsp]
	MOV qword [rsp], rax
; -- Place -- 
	PUSH 2
; -- Mod -- 
	POP rbx
	MOV rdx, 0
	IDIV rbx
	MOV qword [rsp], rdx
; -- JmpEq0 -- 
	CMP qword [rsp], 0
	JE exit
; -- Print -- 
	POP rax
	sub rsp, 32
	LEA rcx, stringLiteral_0
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- End -- 
	JMP EXIT_LABEL
; -- Label -- 
exit:
; -- Print -- 
	POP rax
	sub rsp, 32
	LEA rcx, stringLiteral_1
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- End -- 
	JMP EXIT_LABEL
EXIT_LABEL:
	XOR rax, rax
	CALL ExitProcess
