# lab-kompose
Kompose est un outil de conversion de docker-compose vers Kubernetes.

## install Kompose a partir des sources
```shell
wget https://github.com/kubernetes/kompose/archive/refs/tags/v1.23.0.tar.gz
tar -zxvf v1.23.0.tar.gz
cd kompose-1.23.0/
make
sudo cp kompose /usr/local/bin
kompose version
```
## install Kompose a partir du binaire
```shell
curl -L https://github.com/kubernetes/kompose/releases/download/v1.22.0/kompose-linux-amd64 -o kompose
chmod +x kompose
sudo mv ./kompose /usr/local/bin/kompose
````

## Convertir un projet qui contient  un docker compose
```shell
cd
git clone https://github.com/<repo_perso>/todo-flask-postgresql.git
cd todo-flask-postgresql
mkdir k8s
cd k8s
kompose version
kompose -f ../docker-compose.yml convert
```
