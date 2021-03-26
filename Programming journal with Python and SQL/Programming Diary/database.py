import sqlite3
connection = sqlite3.connect('data.db')
connection.row_factory = sqlite3.Row


def create_table():
	with connection:
		connection.execute("CREATE TABLE IF NOT EXISTS entries (content text,date text);")



def add_entry(entry_content,entry_date):
	with connection:
		connection.execute(f"INSERT INTO entries VALUES ('?,?);",(entry_content, entry_date))


def get_entries():
	cursur = connection.execute("SELECT * FROM entries")
	return cursur
	# cursur.fetchone() # gets the first record
	# cursur.fetchall() # gets all of the results and puts in a list
	# points to the first row in result