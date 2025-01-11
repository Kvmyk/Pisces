scan
jmpEq0 L2
jmpGt0 L0 
print "Negative"
end

L0:
place 3
sub
jmpEq0 L1
jmpGt0 L0
print "Not divisible by 3"
end

L1:
print "Divisible by 3"
end

L2:
print "Zero"
end