## Presentation
Lirimix is a web application displaying lyrics (in irish: "liricí") of Irish songs from the War of Independance era, going from the Easter Uprising in 1916 to the Civil War in 1923.
It is designed as a digital edition which offers interactive navigation through indexes, hyperlinks and retrieval of the songs from the corpus encoded in XML-TEI. 

## Install me
1. Install lirimix from the master branch on the Github repository:
`$ $ git clone https://github.com/mirepoixjl/lirimix.git`

2. Install Python via the [site] (https://www.python.org/downloads/). 

3. Create a virtual environment using VirtualEnv. In the terminal, type the command-line: `$ pip install virtualenv` to install VirtualEnv then` $ virtualenv -p python3 env` or under windows: `$ virtualenv -p` then` $ env: python3 env`

4. Activate the virtual environment via `$ source env / bin / activate`. To exit the environment simply type `$ ctrl + C`.

5. In the terminal, go to the `requirements.txt` file, then install the different packages required with the following command:` $ pip install -r requirements.txt`.

6. In the terminal, enter the command `$ cd lirimix /`, then in the folder, launch the application with the command `$ python run.py` or` $ python3 run.py` via the local server and according to your version of python (`$ python --version or -V`).
