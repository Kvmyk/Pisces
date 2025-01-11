; -- header --
bits 64
default rel
; -- variables --
section .bss 
read_number resd 1; 64-bits int = 8 bytes
; -- constants --
section .data
read_format db "%d", 0; the format string for scanf
stringLiteral_0 db "Enter 5 numbers:", 0xd,0xa, 0
stringLiteral_1 db "Original array:", 0xd,0xa, 0
stringLiteral_2 db "", 0xd,0xa, 0
stringLiteral_3 db "", 0xd,0xa, 0
stringLiteral_4 db "", 0xd,0xa, 0
stringLiteral_5 db "", 0xd,0xa, 0
stringLiteral_6 db "", 0xd,0xa, 0
stringLiteral_7 db "Sorted array:", 0xd,0xa, 0
stringLiteral_8 db "", 0xd,0xa, 0
stringLiteral_9 db "", 0xd,0xa, 0
stringLiteral_10 db "", 0xd,0xa, 0
stringLiteral_11 db "", 0xd,0xa, 0
stringLiteral_12 db "", 0
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
; -- Array -- 
	sub rsp, 40
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
; -- Scan -- 
	LEA rcx, read_format
	LEA rdx, read_number
	sub rsp, 32
	CALL scanf
	add rsp, 32
	MOV rax, qword [read_number]
	PUSH rax
; -- Display -- 
	sub rsp, 32
	LEA rcx, stringLiteral_1
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Load -- 
	mov rax, [rsp + 0]
	push rax
; -- Print -- 
	sub rsp, 8
	LEA rcx, stringLiteral_2
	XOR rax, rax
	CALL printf
	add rsp, 8
; -- Load -- 
	mov rax, [rsp + 8]
	push rax
; -- Print -- 
	sub rsp, 8
	LEA rcx, stringLiteral_3
	XOR rax, rax
	CALL printf
	add rsp, 8
; -- Load -- 
	mov rax, [rsp + 16]
	push rax
; -- Print -- 
	sub rsp, 8
	LEA rcx, stringLiteral_4
	XOR rax, rax
	CALL printf
	add rsp, 8
; -- Load -- 
	mov rax, [rsp + 24]
	push rax
; -- Print -- 
	sub rsp, 8
	LEA rcx, stringLiteral_5
	XOR rax, rax
	CALL printf
	add rsp, 8
; -- Load -- 
	mov rax, [rsp + 32]
	push rax
; -- Print -- 
	sub rsp, 8
	LEA rcx, stringLiteral_6
	XOR rax, rax
	CALL printf
	add rsp, 8
; -- Label -- 
L1:
; -- Place -- 
	PUSH 0
; -- Label -- 
L2:
; -- Load -- 
	mov rax, [rsp + 0]
	push rax
; -- Load -- 
	mov rax, [rsp + 8]
	push rax
; -- Sub -- 
	POP rax
	SUB qword [rsp], rax
; -- JmpGt0 -- 
	CMP qword [rsp], 0
	JG L3
; -- Label -- 
L3:
; -- Swap -- 
	mov rax, [rsp + 0]
	mov rbx, [rsp + 8]
	mov [rsp + 0], rbx
	mov [rsp + 8], rax
; -- Label -- 
L4:
; -- Place -- 
	PUSH 1
; -- Sub -- 
	POP rax
	SUB qword [rsp], rax
; -- JmpGt0 -- 
	CMP qword [rsp], 0
	JG L2
; -- Display -- 
	sub rsp, 32
	LEA rcx, stringLiteral_7
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Load -- 
	mov rax, [rsp + 0]
	push rax
; -- Print -- 
	sub rsp, 8
	LEA rcx, stringLiteral_8
	XOR rax, rax
	CALL printf
	add rsp, 8
; -- Load -- 
	mov rax, [rsp + 8]
	push rax
; -- Print -- 
	sub rsp, 8
	LEA rcx, stringLiteral_9
	XOR rax, rax
	CALL printf
	add rsp, 8
; -- Load -- 
	mov rax, [rsp + 16]
	push rax
; -- Print -- 
	sub rsp, 8
	LEA rcx, stringLiteral_10
	XOR rax, rax
	CALL printf
	add rsp, 8
; -- Load -- 
	mov rax, [rsp + 24]
	push rax
; -- Print -- 
	sub rsp, 8
	LEA rcx, stringLiteral_11
	XOR rax, rax
	CALL printf
	add rsp, 8
; -- Load -- 
	mov rax, [rsp + 32]
	push rax
; -- Print -- 
	sub rsp, 8
	LEA rcx, stringLiteral_12
	XOR rax, rax
	CALL printf
	add rsp, 8
; -- End -- 
	JMP EXIT_LABEL
EXIT_LABEL:
	XOR rax, rax
	CALL ExitProcess
