# todo-flask-postgres

```shell
sudo mkdir -p /opt/postgres  # create shared directory
sudo chmod 1777 /opt/postgres  # change to executable mode
#Add a line in /etc/exports
sudo vi /etc/exports
/opt/postgres/  *(rw,sync,no_root_squash,subtree_check)
sudo exportfs -ra   # reload for the change takes effect
```

## Set up postgresql on a PersistentVolume
```shell
# change the serve IP address in the following file before proceding
k create -f mypostgres-pv.yaml
k get pv
k create -f mypostgres-pvc.yaml
k get pvc
k create -f db-deployment.yaml
k get pod
k create -f db-service.yaml
k get svc 
```
## Set up the database using JetBrains Goland ( port 30010)
CREATE DATABASE tododb;  
and execute sql/todos.sql script  

## install pgadmin4 (port 30100)
k create -f pgadmin-deployment.yaml
k create -f pgadmin-service.yaml


## Todo application 
```shell
docker build -t todoapplication-postgres .
docker login
# enter username and password
docker tag todoapplication-postgres <your docker_hub_account>/todoapplication-postgres
docker push <your docker_hub_account>/todoapplication-postgres
```

## Deploy the app  (port 32500)
```shell
k create -f todoapplication-deployment.yaml
k create -f todoapplication-service.yaml