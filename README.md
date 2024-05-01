# Pet-Note
Pet-Note is a pet-selling website that allows buyers to select their desired pet from a wide range of pet varieties and species. The website is built using the Python programming language and the Django web framework, with a MySQL database management system and JavaScript to make the system interactive.

Buyers can browse through the listing of pets and select the one they want to purchase. They can also search for pets based on various filters such as breed, species and price.
The system admin has access to the record of every purchase made from the system. They can see details such as the buyer's name, the pet purchased, the date of purchase and the price paid. The admin can also reply to any queries buyers raise on the website.

Overall, Pet-Note is a comprehensive and user-friendly pet-selling website that leverages the power of Python, Django, MySQL, and JavaScript to provide a seamless and intuitive experience for buyers. The website also offers a robust system for the admin to manage purchases and respond to queries.


## To Run the application -
After clonning the repo you need to create a `.env` file with the following key values:
```env
#Django Secret key
SECRET_KEY=""

#Database Credentials
DB_NAME=""
DB_USER=""
DB_PASS=""
DB_HOST=""
DB_PORT=""

#Email credentials
EMAIL_ID=""
EMAIL_PASSWORD=""
```
The project can run successfully without the values for `Email credentials` but other credentials are and values are required to run the project successfully.  
However, the email functionality can not be used with the `Email credentials`.

Create a virtual environment in Python with the name `env` or any other desired name.
```shell
python3 -m venv venv
```

Activate the created virtual environment.
```shell
source venv/bin/activate
```

Navigate to the project root diractory if not yet in the root directory and install the dependencies specified in the `requirements.txt` file.
```shell
pip install -r requirements.txt
```

Once the requirements are successfully installed, the project can be served using the the uvicorn command,
```shell
python manage.py runserver
```
or can run on the desired port using
```shell
python manage.py runserver 8000
```

Finally the application will be accessible at
```url
http://127.0.0.1:8000
```
