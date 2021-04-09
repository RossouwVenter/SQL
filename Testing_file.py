# Dates
import pytz
import json

user_timezone = input("Enter your time Zone: ").strip()

try:
    pytz.timezone(user_timezone)
except pytz.exceptions.unkwonTimeZoneError:
    print("That was not a vali timezone")
    raise

with open("user_config.json", "w") as config:
    json.dump({"timezone": user_timezone}, config)



# Save dates
import psycopg2

load_dotenv()

connection = psycopg2.connect(os.environ.get("DATABASE_URI"))