friends = ['Rolf','Bob','Jen']

print('Jen' in friends)

number = 7

start = input('Press "y" to start: ')

if start == "y":
	user_number = int(input('Guess the number: '))
	if user_number == number:
		print('You guessed correctly!') 
	elif abs(number - user_number)  == 1: #abs is the absolute number.
		print('you are one of!')
	else:
		print('Wrong number!')