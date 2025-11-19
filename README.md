# MariaDB Setup and Configuration Guide for Windows

This guide explains how to set up MariaDB, create a database, and Create Database User

## 1. Installing MariaDB

Installing MariaDB on Ubntu

```shell
apt update && apt install mariadb-server -y
```

## 2. Securing MariaDB

Open the Command Prompt as Administrator and run the following command to secure your installation:

```shell

mysql_secure_installation
```

Follow the prompts to:
Set a root password.
Remove insecure default users and test databases.
Disable remote root login.

## 3. Setting Up the Database

Open terminal and login to MariaDB:

```bash

mysql -u root -p
```

Enter the root password when prompted.

Create a new database and user:

```sql
CREATE DATABASE student_db;
GRANT ALL PRIVILEGES ON springbackend.* TO 'username'@'localhost' IDENTIFIED BY 'your_password';
```
Replace username and your_password with your desired username and password.

Exit MariaDB:

```sql

EXIT;
```

## 4. You will need Database Credentials to Connect Backend with Database
1. DB_HOST = 172.17.0.2
2. DB_USER = root
3. DB_PASS = redhat
4. DB_PORT = 3306
5. DB_NAME = student_db



THIS CHANGES IS FOR JENKINS TEST




--------------------------------------------------------------

## THREE TIER USING KUBERNETES ##

# STEP 1 
 <https://github.com/abhilashmwaghmare/EASY_CRUD>

 # clone the repo and switch to devops branch


 ## FOR THE DATABASE ##

 # create directory eg. <database-yaml>
    create yaml files 
    1. statefulset.yaml
    2. service.yaml
    3. secret.yaml
    4. pv and pvc.yaml

# cd /backend 

# vim application.properties

server.port=8080
spring.datasource.url=jdbc:mariadb://<add sts-db-clusterIP>:3306/student_db
spring.datasource.username=root
spring.datasource.password=redhat
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true

--------------------------------------------------

# Now build the image (backend)

docker build -t <username>/imagenameBE:latest .

docker login and push image to <docker hub> 

docker push <username>/imagenameBE:latest

## FOR THE BACKEND ##

# create directory eg. <backend-yaml>
   create yaml files
   1. deployment.yaml
   2. service.yaml
   3. hpa.yaml


# cd /frontend
 # vim .env 

   VITE_API_URL = "http://<backend-ip>:<nodeportip>/api"
                           <public-ip>
   

   build image 

   docker build -t <username>/imagenameFE:latest .

   docker push <username>/imagenameFE:latest

## FOR THE FRONTEND ## 

# create directory eg. <frontend-yaml>
  create yaml files
   1. deployment.yaml
   2. service.yaml
   3. hpa.yaml
   4. ingress.yaml

  

kubectl get svc -A - to list all the ns
kubectl get all -A 