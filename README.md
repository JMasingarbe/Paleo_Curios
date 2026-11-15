# Paleo_Curios
Projet d'étude pour le Titre de développeuse web et web mobile


## Starting PaleoCurios on Docker
1. Download the whole project.
2. Add an `.env` file with :
```
WEB_PORTS=8000
PHPMYADMIN_PORTS=8080

DATABASE_HOST=mysql
DATABASE_PORT=3307
DATABASE_NAME=
DATABASE_USERNAME=
DATABASE_PASSWORD=
MYSQL_ROOT_PASSWORD=
```
3. In a terminal go to the project's directory and run :
```
docker compose up -d --build
``` 