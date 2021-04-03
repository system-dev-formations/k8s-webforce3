# Todo-flask-sqlite

## Build on docker
```shell
cd ~/k8s-webforce3/todo-flask-sqlite
cd sqlite3
docker build -t sqlite3 .
docker login 
# enter username and password
docker tag sqlite3 <your docker_hub_account>/sqlite3
docker push <your docker_hub_account>/sqlite3
```

## Install on kubernetes
```shell
k create -f lan_network-networkpolicy.yaml
k create -f mypostgres-pv.yaml
k get pv
k create -f mypostgres-pvc.yaml
k get pvc
k create -f mysqlite-deployment.yaml
```

## Create the database sqlite
```shell
cp sql/todos.sql /opt/sfw
k exec -it mysqlite-xxxx -- /bin/bash 
cd /opt/sqlite
./sqlite3 ../data/tododb.db < ../data/todos.sql
```

## Todo application
```shell
docker build -t todo-sqlite .
docker login
# enter username and password
docker tag sqlite <your docker_hub_account>/todo-sqlite3
docker push <your docker_hub_account>/todo-sqlite3
```

## Deploy the app
```shell
k create -f todoapplication-deployment.yaml
k create -f todoapplication-service.yaml
```

## Check 