; -- header --
bits 64
default rel
; -- variables --
section .bss 
; -- constants --
section .data
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
; -- JmpEq0 -- 
	CMP qword [rsp], 0
	JE L2
; -- JmpGt0 -- 
	CMP qword [rsp], 0
	JG L0
; -- Print -- 
; -- NOT IMPLEMENTED --
; -- End -- 
	JMP EXIT_LABEL; -- Label -- 
L0:
; -- Place -- 
	PUSH 3
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
; -- NOT IMPLEMENTED --
; -- End -- 
	JMP EXIT_LABEL; -- Label -- 
L1:
; -- Print -- 
; -- NOT IMPLEMENTED --
; -- End -- 
	JMP EXIT_LABEL; -- Label -- 
L2:
; -- Print -- 
; -- NOT IMPLEMENTED --
; -- End -- 
	JMP EXIT_LABELEXIT_LABEL:
	XOR rax, rax
	CALL ExitProcess
