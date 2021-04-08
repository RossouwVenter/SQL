from typing import List, Tuple

import psycopg2
from psycopg2.extras import execute_values


Poll = Tuple[int, str, str]
Option = Tuple[int, str, int]
Vote = Tuple[str, int]



CREATE_POLLS = "CREATE TABLE IF NOT EXISTS polls (id SERIAL PRIMARY KEY, title TEXT, owner_username TEXT);"
CREATE_OPTIONS = "CREATE TABLE IF NOT EXISTS options (id SERIAL PRIMARY KEY, option_text TEXT, poll_id INTEGER);"
CREATE_VOTES = "CREATE TABLE IF NOT EXISTS votes (username TEXT, option_id INTEGER);"

SELECT_POLL = "SELECT * FROM polls WHERE id = %s;"
SELECT_ALL_POLLS = "SELECT * FROM polls;"
SELECT_POLL_OPTIONS = """SELECT * FROM options WHERE polls.id = %s;"""
SELECT_LATEST_POLL_WITH_OPTIONS = """SELECT * FROM polls
WHERE polls.id = (
    SELECT id FROM polls ORDER BY id DESC LIMIT 1
);"""


SELECT_OPTION = "SELECT * FROM options WHERE id = %s"
SELECT_VOTES_FOR_OPTION = "SELECT * FROM votes WHERE option_id = %s"

INSERT_POLL_RETURN_ID = "INSERT INTO polls (title, owner_username) VALUES (%s, %s) RETURNING id;"
INSERT_OPTION_RETURNING_ID = "INSERT INTO options (option_text, poll_id) VALUES (%s,%s) RETURNING id ;"
INSERT_VOTE = "INSERT INTO votes (username, option_id) VALUES (%s, %s);"


def create_tables(connection):
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(CREATE_POLLS)
            cursor.execute(CREATE_OPTIONS)
            cursor.execute(CREATE_VOTES)

# --Polls--

def create_poll(connection, title: str, owner: str):
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(INSERT_POLL_RETURN_ID, (title, owner))

            poll_id = cursor.fetchone()[0]
            return poll_id


def get_polls(connection) -> List[Poll]: 
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(SELECT_ALL_POLLS)
            return cursor.fetchall()

def get_poll(connection, poll_id : int) -> poll:
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(SELECT_POLL, (poll_id,))
            return cursor.fetchone()


def get_latest_poll(connection) -> Poll:
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(SELECT_LATEST_POLL)
            return cursor.fetchone()


def get_poll_options(connection, poll_id: int) -> List[Option]:
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(SELECT_POLL_OPTIONS, (poll_id,))
            return cursor.fetchall()

#  --options--

get get_option(connection, option_id: int)-> Option:
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(SELECT_OPTION, (option_id))
            return cursur.fetchone()

def add_option(connection,option_text,poll_id)
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(INSERT_OPTION_RETURNING_ID, (option_text,poll_id))
            option_id = cursur.fetchone()[0]
            return option_id
            

def get_votes_for_option(connection,option_id: int) -> List[Vote]
    


def add_poll_vote(connection, username: str, option_id: int):
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(INSERT_VOTE, (username, option_id))
