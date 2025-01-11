# Example bubble sort program
display "Enter 5 numbers:"
array 5       # Create array of size 5
scan          # Read 5 numbers
scan
scan
scan
scan

display "Original array:"
load 0
print
load 1 
print
load 2
print
load 3
print
load 4
print

L1:           # Outer loop
place 0       # i = 0
L2:           # Inner loop
load 0        # Load array[i]
load 1        # Load array[i+1]
sub           # Compare array[i] - array[i+1]
jmpGt0 L3     # If array[i] > array[i+1], swap
jmp L4        
L3:
swap 0        # Swap array[i] and array[i+1]
L4:
place 1       # i++
sub
jmpGt0 L2     # If i < size-1, continue inner loop

display "Sorted array:"
load 0
print
load 1
print
load 2
print
load 3
print
load 4
print

end