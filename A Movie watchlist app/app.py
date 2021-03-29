import datetime
import database

menu = """ Please select one of the following options:
1) Add a new movie
2) View upcomming movies.
3) View all movies
4) Watch a movie
5) View watched movies.
6) Exit.

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
	for movie in movies:
		movie_date = datetime.datetime.fromtimestamp(movie[1])
		human_date = movie_date.strftime("%b %d %Y")
		print(f'{movie[0]} (on {human_date})')
	print("---- \n")

def promt_watch_movie():
	movie_title = input("Enter movie title you've watched: ")
	database.watch_movie(movie_title)

while (user_input := input(menu)) != '6':
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
		movies = database.get_watched_movies()
		print_movie_list("Watched", movies)
	else:
		print('Invalid input, please try again!')
