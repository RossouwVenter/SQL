import os 
from psycopg2.pool import SimpleConnectionPool
from dotenv import load_dotenv

DATABASE_PROMPT = "postgres://yrtfcxyx:L2R3L_nMSCme_EARV_gBzlqqPf7RPxEC@dumbo.db.elephantsql.com:5432/yrtfcxyx"

database_uri = imput(DATABASE_PROMPT)
if not database_uri:
    load_dotenv
    database_uri = os.environ["DATABASE_URI"]

pool = SimpleConnectionPoll(minconn = 1, maxconn= 10,dsn = database_uri)