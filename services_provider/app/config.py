import pyodbc

# SQL Server connection configuration
server = 'DESKTOP-MMNADLC\\SQLEXPRESS;'
database = 'ServicesProvider'
username = 'zerotrustsolutions'
password = '0000'
connection_string = f"DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}"

# Function to get a database connection
def get_db_connection():
    conn = pyodbc.connect(connection_string)
    return conn


# Add email server configuration
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_USERNAME = 'pbinse.mcbi@gmail.com'
EMAIL_PASSWORD = 'qtzr fppr kcpx exwi'
