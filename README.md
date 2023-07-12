# Database-Project-WWI21DSB

In this database-project we developed a web database-management-system (DBMS) with flask backend and a postgresql database.<br>
The use-case is a hospital system which let's you keep track of patients, employees etc. and let's you restock your medicine.
After restocking your medicine a bill will be created which contains total cost.

The whole project is dockerized.
Adminer is included to try out predefined queries. Credentials are the following:<br>
Server: database-project<br>
Benutzer: admin<br>
Passwort: 123<br>
Datenbank: hospital<br>

# app_docker

This application contains all necessary code for the normal docker setup.
Sadly the 0.0.0.0:5000 port inside the container which is bound to the flask-app can't be reached from outside the container for some reason. We didn't manage to fix this issue.

To run this app version:

`docker compose up`

The app should be available at:

`localhost:5000`

Adminer will be available at:

`localhost:1234`

# app_simple_docker

This app contains all necessary code to run the application without it being dockerized completly.

To run this app version:

`cd .\app_simple_docker\`

`docker compose up`

`flask run`

The app will be available at:

`localhost:5000`

Adminer will be available at:

`localhost:1234`
