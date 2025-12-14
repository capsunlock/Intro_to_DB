import mysql.connector
from mysql.connector import errorcode

def create_alx_book_store_database():
    """
    Connects to the MySQL server and attempts to create the 'alx_book_store' 
    database using CREATE DATABASE IF NOT EXISTS.
    """
    # --- 1. CONFIGURATION: Replace these with your MySQL server credentials ---
   config = {
        'user': 'root',               # Try 'root' first
        'password': '',                 # Try an empty string first
        'host': 'localhost',
        'port': 3306
    }
    
    DB_NAME = 'alx_book_store'
    conn = None
    cursor = None

    try:
        # 2. Open Connection to the MySQL Server
        # We connect without specifying a database yet
        print(f"Attempting to connect to MySQL server at {config['host']}...")
        conn = mysql.connector.connect(**config)
        cursor = conn.cursor()
        print("Connection successful.")

        # 3. SQL Command to Create Database (handles existing database gracefully)
        # Using IF NOT EXISTS ensures the script does not fail if the DB is already there
        sql_command = f"CREATE DATABASE IF NOT EXISTS alx_book_store"
        
        # Execute the command
        # The success message is tied to the successful execution of the command
        cursor.execute(sql_command)
        
        # Check if the database was actually created (query OK, 1 row affected)
        # We cannot use SELECT/SHOW, so we rely on the command's success.
        print(f"Database '{DB_NAME}' processed successfully (created or already existed).")
        
        # NOTE: A more sophisticated script might use SELECT/SHOW to verify creation,
        # but adhering to the constraint, we confirm the command executed correctly.

    except mysql.connector.Error as err:
        # 4. Handle Connection and Execution Errors
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Error: Failed to connect. Check your user name or password.")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            # This shouldn't happen here, but good practice to include
            print(f"Error: Database does not exist.")
        else:
            print(f"Error connecting to the DB: {err}")
            
    finally:
        # 5. Close Connection and Cursor
        # This ensures the resources are freed up regardless of success or failure
        if cursor:
            cursor.close()
            print("Cursor closed.")
        if conn and conn.is_connected():
            conn.close()
            print("Database connection closed.")

if __name__ == "__main__":
    create_alx_book_store_database()