# lab-kompose
Kompose est un outil de conversion de docker-compose vers Kubernetes.

## install Kompose a partir des sources
```shell
wget https://github.com/kubernetes/kompose/archive/v1.22.0.tar.gz
cd kompose-1.22.0/
make
sudo kompose /usr/local/bin
kompose version
```
## install Kompose a partir du binaire
```shell
curl -L https://github.com/kubernetes/kompose/releases/download/v1.22.0/kompose-linux-amd64 -o kompose
chmod +x kompose
sudo mv ./kompose /usr/local/bin/kompose
````

## Obtenir un projet contenant un docker compose
```shell
cd
git clone   https://github.com/<repo_perso>/todo-flask-sqlite.git
cd todo-flask-sqlite
kompose version
kompose convert
```
