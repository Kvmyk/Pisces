# Pisces Programming Language Documentation 🌊🐟📒

## `place`
Places a number on the stack.

**Syntax:**
```psc
place <number>
```
## `pop`
Removes the top value from the stack.

**Syntax:**
```psc
pop
```
## `print`
Prints a string literal to the console.

**Syntax:**
```psc
print "<your message>"
```
**Example**:
```psc
print "bul bul bul"
```
It is also possible to print the top of the stack by using the "%d".

**Syntax:**
```psc
print "%d"
```
**Example:**
```psc
scan
scan
add
print "The result of your addition is equal to %d"
end
```

## `scan`
Reads an integer from user input and pushes it onto the stack.

**Syntax:**
```psc
scan
```
**Example**:
```psc
scan
print "You entered a number."
```

## `add`
Pops two values from the stack, adds them, and pushes the result.

**Syntax:**
```psc
add
```
**Example**:
```psc
place 5
place 10
add
print "Addition complete."
end
```

## `sub`
Pops two values from the stack, subtracts the second from the first, and pushes the result.

**Syntax:**
```psc
sub
```
**Example:**
```psc
place 20
place 5
sub
print "Subtraction complete."
end
```

## `mul`
Pops two values from the stack, multiplies them, and pushes the result.

**Syntax:**
```psc
mul
```
**Example**
```psc
place 4
place 5
mul
print "Multiplication complete."
end
```

## `div`
Pops two values from the stack, divides the first by the second, and pushes the quotient.

**Syntax:**
```psc
div
```
**Example**
```psc
place 10
place 2
div
print "Division complete."
end
```

## `mod`
Pops two values from the stack, divides the first by the second, and pushes the remainder.

**Syntax:**
```psc
mod
```
**Example**
```psc
place 10
place 3
mod
print "Modulo complete."
end
```

## `jmpEq0`
Jumps to a specified label if the top stack value is equal to zero.

**Syntax:**
```psc
jmpEq0 <label>
```
**Example:**
```psc
place 0
jmpEq0 my_label
print "This won't print."
my_label:
print "Jumped successfully."
end
```
## `jmpGt0`
Jumps to a specified label if the top stack value is greater than zero.

**Syntax:**
```psc
jmpGt0 <label>
```
**Example:**
```psc
place 5
jmpGt0 positive_label
print "This won't print."
positive_label:
print "Jumped to positive label."
end
```
## `end`
Terminates the program.

**Syntax:**
```psc
end
```
**Example:**
```psc
print "This is the end."
end
```



