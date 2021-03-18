number = 7

while True:
	user_input = input('Would you like to play? (Y/n) ')	

	if user_input == "n":
		break

	user_number = int(input('Guess the number: '))
	if user_number == number:
		print('You guessed correctly!') 
	elif abs(number - user_number)  == 1: #abs is the absolute number.
		print('you are one of!')
	else:
		print('Wrong number!')

# For loop:

Print('For loops:')

friends = ['Rolf','Bob','Jen','Anne']

for friend in friends:
	print(f'{friends} is my friend')


grades = [35,67,98,100,100]
total = 0
amount len(grades)

for grade in grades:
	total += grade

print(total/amount)
#  does the same as for loop.
total = sum(grades)