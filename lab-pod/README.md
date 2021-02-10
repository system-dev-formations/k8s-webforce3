# Imperative et Declarative Commandees
## Creation d'un pod avec une commande imperative
```shell
kubectl run nginx --image=nginx  --port=8080
```

## Create d'un pod d'une maniere declarative avec un fichier YAML
```shell
cd k8s-webforce3/lab-pod
kubectl get pod nginx -o yaml > first.yaml
```
### Utilisation de kubectl-neat pour nettoyer les scripts pour qui soient plus lisibles
Voir https://github.com/itaysk/kubectl-neat
```shell
wget https://github.com/itaysk/kubectl-neat/archive/v2.0.2.tar.gz
tar -zxvf v2.0.2.tar.gz 
cd kubectl-neat-2.0.2/
make
sudo mv kubectl-neat_linux /usr/local/bin/kubetcl-neat
```
## usage avec un pipe et une redirection 
```
k get pod nginx -o yaml | kubectl-neat_linux  > first.yaml
```



