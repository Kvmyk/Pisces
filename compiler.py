import sys
import os
import time

class Instruction:
    @staticmethod
    def handle_instruction(op_code, program, ip, out):
        if op_code.endswith(":"):
            out.write(f"; -- Label -- \n")
            out.write(f"{op_code}\n")
        elif op_code == "place":
            number = program[ip]
            ip += 1
            out.write(f"; -- Place -- \n")
            out.write(f"\tPUSH {number}\n")
        elif op_code == "pop":
            out.write(f"; -- Pop -- \n")
            out.write(f"\tPOP rax\n")
        elif op_code == "add":
            out.write(f"; -- Add -- \n")
            out.write(f"\tPOP rax\n")
            out.write(f"\tADD qword [rsp], rax\n")
        elif op_code == "sub":
            out.write(f"; -- Sub -- \n")
            out.write(f"\tPOP rax\n")
            out.write(f"\tSUB qword [rsp], rax\n")
        elif op_code == "mul":
            out.write(f"; -- Mul -- \n")
            out.write(f"\tPOP rax\n")
            out.write(f"\tIMUL rax, qword [rsp]\n")
            out.write(f"\tMOV qword [rsp], rax\n")
        elif op_code == "div":
            out.write(f"; -- Div -- \n")
            out.write(f"\tPOP rbx\n")
            out.write(f"\tMOV rdx, 0\n")
            out.write(f"\tIDIV rbx\n")
            out.write(f"\tMOV qword [rsp], rax\n")
        elif op_code == "mod":
            out.write(f"; -- Mod -- \n")
            out.write(f"\tPOP rbx\n")
            out.write(f"\tMOV rdx, 0\n")
            out.write(f"\tIDIV rbx\n")
            out.write(f"\tMOV qword [rsp], rdx\n")
        elif op_code == "scan":
            out.write(f"; -- Scan -- \n")
            out.write(f"\tLEA rcx, read_format\n")
            out.write(f"\tLEA rdx, read_number\n")
            out.write(f"\tsub rsp, 32\n") 
            out.write(f"\tCALL scanf\n")
            out.write(f"\tadd rsp, 32\n")
            out.write(f"\tMOV rax, qword [read_number]\n")  
            out.write(f"\tPUSH rax\n")
        elif op_code == "print":
            string_literal_index = program[ip]
            ip += 1
            out.write(f"; -- Print -- \n")
            if 'scan' in program or 'place' in program:
                out.write(f"\tPOP rax\n")
            out.write(f"\tsub rsp, 32\n")
            out.write(f"\tLEA rcx, stringLiteral_{string_literal_index}\n")
            out.write(f"\tMOV rdx, rax\n")
            out.write(f"\tXOR rax, rax\n")
            out.write(f"\tCALL printf\n")
            out.write(f"\tadd rsp, 32\n")
        elif op_code == "top":
            out.write(f"; -- Top -- \n")
            out.write(f"\tPOP rax\n")
            out.write(f"\tsub rsp, 32\n")
            out.write(f"\tLEA rcx, [printNumberFormat]\n")
            out.write(f"\tMOV rdx, rax\n")
            out.write(f"\tXOR rax, rax\n")
            out.write(f"\tCALL printf\n")
            out.write(f"\tadd rsp, 32\n")
        elif op_code == "jmpEq0":
            label = program[ip]
            ip += 1
            out.write(f"; -- JmpEq0 -- \n")
            out.write(f"\tCMP qword [rsp], 0\n")
            out.write(f"\tJE {label}\n")
        elif op_code == "jmpGt0":
            label = program[ip]
            ip += 1
            out.write(f"; -- JmpGt0 -- \n")
            out.write(f"\tCMP qword [rsp], 0\n")
            out.write(f"\tJG {label}\n")
        elif op_code == "end":
            out.write(f"; -- End -- \n")
            out.write(f"\tJMP EXIT_LABEL\n")
        return ip

class AsmGenerator:
    @staticmethod
    def generate_asm_header(out):
        out.write("""; -- header --
bits 64
default rel
""")

    @staticmethod
    def generate_asm_variables(out):
        out.write("""; -- variables --
section .bss 
read_number resq 1; 64-bits int = 8 bytes
""")

    @staticmethod
    def generate_asm_constants(out, string_literals):
        out.write("""; -- constants --
section .data
read_format db "%d", 0; the format string for scanf
printNumberFormat db "%lld", 0xd, 0xa, 0
""")
        for i, string_literal in enumerate(string_literals):
            out.write(f"stringLiteral_{i} db \"{string_literal}\", 0\n")

    @staticmethod
    def generate_asm_entry_point(out):
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

class PiscesParser:
    @staticmethod
    def parse_program(file_path):
        with open(file_path, "r") as program_file:
            lines = [line.strip() for line in program_file.readlines()]

        program = []
        string_literals = []
        for line in lines:
            parts = line.split(" ")
            op_code = parts[0]
            if op_code == "":
                continue
            program.append(op_code)

            if op_code == "place":
                program.append(int(parts[1]))
            elif op_code == "print":
                string_literal = ' '.join(parts[1:])[1:-1]
                program.append(len(string_literals))
                string_literals.append(string_literal)
            elif op_code == "jmpEq0" or op_code == "jmpGt0":
                label = parts[1]
                program.append(label)
            elif op_code == "scan":
                continue
            elif op_code == "mod":
                continue
            elif op_code == "end":
                continue

        return program, string_literals

class PiscesCompiler:
    def __init__(self, file_path):
        self.file_path = file_path
        self.asm_file_path = file_path[:-4] + ".asm"
        self.exe_file_path = file_path[:-4] + ".exe"

    def compile(self):
        print("[PiscesCMD] Parsing...")
        program, string_literals = PiscesParser.parse_program(self.file_path)
        print("[PiscesCMD] Parsing complete")

        print("[PiscesCMD] Assembling...")
        with open(self.asm_file_path, "w") as out:
            AsmGenerator.generate_asm_header(out)
            AsmGenerator.generate_asm_variables(out)
            AsmGenerator.generate_asm_constants(out, string_literals)
            AsmGenerator.generate_asm_entry_point(out)

            ip = 0
            while ip < len(program):
                op_code = program[ip]
                ip += 1
                ip = Instruction.handle_instruction(op_code, program, ip, out)

            out.write(f"EXIT_LABEL:\n")
            out.write(f"\tXOR rax, rax\n")
            out.write(f"\tCALL ExitProcess\n")

        print("[PiscesCMD] Assembling complete")
        print("[PiscesCMD] Linking...")
        os.system(f"nasm -f win64 {self.asm_file_path} -o {self.asm_file_path[:-3]}obj")
        os.system(f"gcc -o {self.exe_file_path} {self.asm_file_path[:-3] + 'obj'} -lkernel32 -lmsvcrt")
        print("[PiscesCMD] Linking complete")

    def run(self):
        print("[PiscesCMD] Running...")
        start_time = time.time()
        os.system(self.exe_file_path)
        end_time = time.time()
        print(f"\n[PiscesCMD] Running complete in {end_time - start_time:.2f} seconds")

if __name__ == "__main__":
    program_file_path = sys.argv[1]
    compiler = PiscesCompiler(program_file_path)
    compiler.compile()
    compiler.run()
