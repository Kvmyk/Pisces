scan
scan
add
jmpGt0 L1


L1:
place 2
sub
jmpEq0 L2
jmpGt0 L1
print "Suma wynikow nie jest podzielna przez 2"
end

L2:
print "Suma wynikow jest podzielna przez 2"
end

