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


