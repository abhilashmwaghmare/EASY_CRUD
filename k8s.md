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