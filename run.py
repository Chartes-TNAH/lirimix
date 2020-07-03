"""file lauching Lirimix"""
from app.routes import app
 

"""
Launching server test, we add a condition to check
that this file is the one currently executed (avoiding an unwanted execution when import from another file) """


if __name__ == "__main__":
	
	app.run(debug=True)