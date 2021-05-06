import os
import psycopg2
from dotenv import load_dotenv

load_dotenv()

SELECT_POLLSA_AND_VOTES = """
SELECT polls.title,SUM(votes.option_id) FROM polls
JOIN options ON options.poll_id = polls.id
JOIN votes ON options.id = votes.option_id
WHERE polls.id = %s
GROUP BY polls.name;"""

connection = psycopg2.connect(os.environ.get("DATABASE_URI"))


def get_polls_and_votes():
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(SELECT_OPTIONS_IN_POLL)
            return cursor.fetchall()