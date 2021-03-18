def hello():
	print('Hello!')

hello()


friends = ['Rolf','Bob']

def add_friend():
	friend_name = input('Enter your friends name: ')
	friend = friends + [friend_name]

add_friend()

# Function arguments and parameters:

def add(x,y):
	total = x + y
	print(total)

add(5,3)


def say_hello(name):
	print(f'Hello! {name}')

say_hello('Bob')

# devide
def devide(devidend,devisor):
	if devisor != 0:
		print(dividend / dicisor)
	else:
		print('You fool!')
devide(dividend = 15,devisor = 6)

def add(x,y):
	return  x + y

add(5,8)
result = add(5,8)
print(result)