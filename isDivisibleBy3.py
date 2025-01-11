import time

number = int(input())

startTime = time.time()

while number > 0:
    number = number - 999
    print(number)

if number == 0:
    print("YES")
else:
    print("NO")

endTime = time.time()

executionTime = endTime - startTime

print(f"Execution time: {executionTime:.2f} seconds")