scan
jmpEq0 L1

L2:
place 2
sub
jmpEq0 L1
jmpGt0 L2
print "odd"
end

L1:
print "even"
end