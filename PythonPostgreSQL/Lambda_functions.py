def add(x, y):
    return x + y

print(add(5,7))

# Lambda function is a function withou a name.
add = lambda x , y: x + y

print(add(5,11))

def double(x):
	return x * 2

sequence  = [1,3,5,9]
doubled = [double(x) for x in sequence]
# Same method
doubled = map(double,sequence)

doubled = list(map(lambda x: x * 2, sequence))