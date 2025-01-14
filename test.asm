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
stringLiteral_0 db "%d", 0xd,0xa, 0
stringLiteral_1 db "%d", 0xd,0xa, 0
stringLiteral_2 db "%d", 0xd,0xa, 0
stringLiteral_3 db "%d", 0xd,0xa, 0
stringLiteral_4 db "%d", 0xd,0xa, 0
stringLiteral_5 db "%d", 0xd,0xa, 0
stringLiteral_6 db "%d", 0xd,0xa, 0
stringLiteral_7 db "%d", 0xd,0xa, 0
stringLiteral_8 db "%d", 0xd,0xa, 0
stringLiteral_9 db "%d", 0xd,0xa, 0
stringLiteral_10 db "%d", 0xd,0xa, 0
stringLiteral_11 db "%d", 0xd,0xa, 0
stringLiteral_12 db "%d", 0xd,0xa, 0
stringLiteral_13 db "%d", 0xd,0xa, 0
stringLiteral_14 db "%d", 0xd,0xa, 0
stringLiteral_15 db "%d", 0xd,0xa, 0
stringLiteral_16 db "%d", 0xd,0xa, 0
stringLiteral_17 db "%d", 0xd,0xa, 0
stringLiteral_18 db "%d", 0xd,0xa, 0
stringLiteral_19 db "%d", 0xd,0xa, 0
stringLiteral_20 db "%d", 0xd,0xa, 0
stringLiteral_21 db "%d", 0xd,0xa, 0
stringLiteral_22 db "%d", 0xd,0xa, 0
stringLiteral_23 db "%d", 0xd,0xa, 0
stringLiteral_24 db "%d", 0xd,0xa, 0
stringLiteral_25 db "%d", 0xd,0xa, 0
stringLiteral_26 db "%d", 0xd,0xa, 0
stringLiteral_27 db "%d", 0xd,0xa, 0
stringLiteral_28 db "%d", 0xd,0xa, 0
stringLiteral_29 db "%d", 0xd,0xa, 0
stringLiteral_30 db "%d", 0xd,0xa, 0
stringLiteral_31 db "%d", 0
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
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_0
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_1
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_2
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_3
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_4
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_5
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_6
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_7
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_8
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_9
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_10
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_11
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_12
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_13
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_14
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_15
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_16
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_17
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_18
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_19
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_20
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_21
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_22
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_23
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_24
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_25
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_26
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_27
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_28
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_29
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_30
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- Print -- 
	sub rsp, 32
	LEA rcx, stringLiteral_31
	MOV rdx, rax
	XOR rax, rax
	CALL printf
	add rsp, 32
; -- End -- 
	JMP EXIT_LABEL
EXIT_LABEL:
	XOR rax, rax
	CALL ExitProcess
