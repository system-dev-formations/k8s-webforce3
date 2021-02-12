# lab-kompose
Kompose est un outil de conversion de docker-compose vers Kubernetes.

## install Kompose
```shell
wget https://github.com/kubernetes/kompose/archive/v1.22.0.tar.gz
cd kompose-1.22.0/
make
sudo kompose /usr/local/bin
kompose version
```

## Obtenir un project contenant un docker compose
```shell
cd
git clone   https://github.com/system-dev-formations/todo-flask-postgres.git
cd todo-flask-postgres
kompose convert
```
