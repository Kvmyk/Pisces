import sys
import os
programFilePath = sys.argv[1]

print("[PiscesCMD] Parsing...")

programLines = []

# ODCZYTUJEMY LINIE Z PLIKU
with open(programFilePath, "r") as programFile:
    programLines = [line.strip() for line in programFile.readlines()]

program = []
for line in programLines:
    parts = line.split(" ")
    opCode = parts[0]

    if opCode == "":
        continue
    # zapisujemy komende do listy tokenow
    program.append(opCode)

    # sprawdzanie każdego tokenu, czy jest komenda
    if opCode == "place":
        number = int(parts[1])
        program.append(number)
    elif opCode == "print":
        stringLiteral = ' '.join(parts[1:])[1:-1]
        program.append(stringLiteral)
    elif opCode == "jmpEq0":
        label = parts[1]
        program.append(label)
    elif opCode == "jmpGt0":
        label = parts[1]
        program.append(label)

stringLiterals = []
for ip in range(len(program)):
    if program[ip] == "print":
        stringLiteral = program[ip+1]
        program[ip+1] = len(stringLiterals)
        stringLiterals.append(stringLiteral)    

print("[PiscesCMD] Parsing complete")

# zamien jezyk na assembler

print("[PiscesCMD] Assembling...")

asmFilePath = programFilePath[:-4] + ".asm"
out = open(asmFilePath, "w")

out.write("""; -- header --
bits 64
default rel
""")

out.write("""; -- variables --
section .bss 
read_number resd 1; 64-bits int = 8 bytes
""")

out.write("""; -- constants --
section .data
read_format db "%d", 0; the format string for scanf
""")
for i, stringLiteral in enumerate(stringLiterals):
    out.write(f"stringLiteral_{i} db \"{stringLiteral}\", 0\n")

out.write("""; -- Entry Point --
section .text
global main
extern ExitProcess
extern printf
extern scanf

main:
\tPUSH rbp
\tMOV rbp, rsp
\tSUB rsp, 32
""")

ip = 0
while ip < len(program):
    opCode = program[ip]
    ip += 1
    if opCode.endswith(":"):
        out.write(f"; -- Label -- \n")
        out.write(f"{opCode}\n")
    elif opCode == "place":
        number = program[ip]
        ip += 1
        out.write(f"; -- Place -- \n")
        out.write(f"\tPUSH {number}\n")
    elif opCode == "pop":
        out.write(f"; -- Pop -- \n")
        out.write(f"\tPOP\n")
    elif opCode == "add":
        out.write(f"; -- Add -- \n")
        out.write(f"\tPOP rax\n")
        out.write(f"\tADD qword [rsp], rax\n")
    elif opCode == "sub":
        out.write(f"; -- Sub -- \n")
        out.write(f"\tPOP rbx\n")
        out.write(f"\tPOP rax\n")
        out.write(f"\tSUB rax, rbx\n")
        out.write(f"\tPUSH rbx\n")
    elif opCode == "print":
        stringLiteralIndex = program[ip]
        ip += 1
        out.write(f"; -- Print -- \n")
        out.write(f"\tsub rsp, 8\n")
        out.write(f"\tLEA rcx, stringLiteral_{stringLiteralIndex}\n")
        out.write(f"\tXOR eax, eax\n")
        out.write(f"\tCALL printf\n")
        out.write(f"\tadd rsp, 8\n")
    elif opCode == "scan":
        out.write(f"; -- Scan -- \n")
        out.write(f"\tLEA rcx, read_format\n")
        out.write(f"\tLEA rdx, read_number\n")
        out.write(f"\tXOR eax, eax\n")
        out.write(f"\tCALL scanf\n")
        out.write(f"\tPUSH qword [read_number]\n")
    elif opCode == "jmpEq0":
        label = program[ip]
        ip +=1
        out.write(f"; -- JmpEq0 -- \n")
        out.write(f"\tCMP qword [rsp], 0\n")
        out.write(f"\tJE {label}\n")
    elif opCode == "jmpGt0":
        label = program[ip]
        ip += 1
        out.write(f"; -- JmpGt0 -- \n")
        out.write(f"\tCMP qword [rsp], 0\n")
        out.write(f"\tJG {label}\n")
    elif opCode == "end":
        out.write(f"; -- End -- \n")
        out.write(f"\tJMP EXIT_LABEL\n")

out.write(f"EXIT_LABEL:\n")
out.write(f"\tXOR rax, rax\n")
out.write(f"\tCALL ExitProcess\n")


out.close()

print("[PiscesCMD] Assembling complete")
os.system(f"nasm -f win64 {asmFilePath} -o {asmFilePath[:-3]}obj")
print("[PiscesCMD] Linking...")
os.system(f"gcc -o {asmFilePath[:-4] + '.exe'} {asmFilePath[:-3]+"obj"} -lkernel32 -lmsvcrt")
print("[PiscesCMD] Linking complete")

print("[PiscesCMD] Running...")
os.system(f"{asmFilePath[:-4] + '.exe'} ")

print("\n[PiscesCMD] Running complete")