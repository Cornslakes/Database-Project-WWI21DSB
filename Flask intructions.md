** Running flask application

The user has to set up environment variable FLASK_APP in order to run application using flask command:

For Linux and macOS users:

(venv) $ export FLASK_APP=app.py
and then run the application:
(venv) $ flask run 

For Microsoft Windows users:
(venv) $ set FLASK_APP=app.py
and then run the application:
(venv) $ flask run 

### In order to activate debug mode you can set environment variable FLUSK_DEBUG:

(venv) $ export FLASK_DEBUG=1

## Database can be created from model classes using flask shell
(venv) $ flask shell 
>>> from app import db 
>>> db.create_all()
Inserting Departments and Employees from command line
>>> r = Department(name='Research')
>>> a = Department(name='Administration')
>>> db.session.add_all([r,a]) 
>>> john = Employee(name='John Smith', address="xxxxxx ", department = r)
>>> db.session.add(john)
>>> db.session.commit() 


## To save all dependent packages in one list
pip freeze >requirements.txt

### To install packages listed in requirements.txt
pip install -r requirements.txt