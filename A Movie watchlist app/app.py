import datetime
import database

menu = """ Please select one of the following options:
1) Add a new movie
2) View upcomming movies.
3) View all movies
4) Watch a movie
5) View watched movies.
6) Add user to the app.
7) Search for a movie.
8) Exit.

Your Selection: """
welcome = "Welcome to the watchlist app!"

print(welcome)
database.create_tables()

def promp_add_movie():
	title = input("MOvie title: ")
	release_date = input('Release date (dd-mm-YYYY): ')
	parsed_date = datetime.datetime.strptime(release_date, "%d-%m-%Y")
	timestamp = parsed_date.timestamp()

	database.add_movie(title,timestamp)

def print_movie_list(heading,movies):
	print("--Upcoming movies--")
	for _id,title,releas_date in movies:
		movie_date = datetime.datetime.fromtimestamp(release_date)
		human_date = movie_date.strftime("%b %d %Y")
		print(f'{_id}: {title} (on {human_date})')
	print("---- \n")

def print_watched_movie_list(username,movies):
	print(f"--{username}'s watched movies --")
	for movie in movies:
		print(f'{movie[1]}')
	print(f'---- \n')

def promt_watch_movie():
	username = input('Username: ')
	movie_title = input("Movie ID: ")
	database.watch_movie(username, movie_id)

def prompt_show_watched_movies():
	username = input('Username: ')
	movies = database.get_watched_movies(username)
	if movies:
		print_movie_list(f"{username} watched , {movies}")
	else:
		print("That user has wathed no movies yet!")

def prompt_search_movies():
	search_term = input('Enter the partial title of the movie: ')
	movies = database.search_movies(search_term)
	if movies:
		print_movie_list("movies found", movies)
	else:
		print("No movies found!")

def promt_add_user():
	username = input('Username: ')
	database.add_user(username)



while (user_input := input(menu)) != '8':
	if user_input == '1':
		promp_add_movie()
	elif user_input == '2':
		movies = database.get_movies(True)
		print_movie_list("Upcoming",movies)
	elif user_input == '3':
		movies = database.get_movies()
		print_movie_list("All",movies)
	elif user_input == '4':
		promt_watch_movie()
	elif user_input == '5':
		prompt_show_watched_movies
	elif user_input == '6':
		prompt_add_user()
	elif user_input == '7':
		prompt_search_movies()
	else:
		print('Invalid input, please try again!')
