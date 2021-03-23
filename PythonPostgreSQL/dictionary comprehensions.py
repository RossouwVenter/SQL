users = [
(0, "Bob","password"),
(1,'Rolf','Bob123'),
(2,'Jose',"longp4assword"),
(3,"username","1234")
]

username_mapping = {user[1]: user for user in users}
print(username_mapping['Bob'])

# Unpakking arguments:
def multiply(*args):
	print(args)
	total = 1
	for arg in args:
		total = total * arg

	return total

multiply(-1)

#  
def add(x, y):
	return x + y

nums = [3, 5]
print(add(*nums))



