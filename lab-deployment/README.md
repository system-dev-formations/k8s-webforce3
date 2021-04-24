# Lab-deployment
## Pre-requis ajoutez ces lignes dans votre .bashrc
```shell
alias k='kubectl'
source <( kubectl completion bash | sed s/kubectl/k/g)
```
## Deployment
```shell
k create deployment nginx --image=nginx
k get deployment
k describe deployment nginx
k get events
k get events --sort-by='.lastTimestamp'
k get deployment nginx -o yaml
```
## Kubectl-neat
### Utilisation de kubectl-neat pour nettoyer les scripts pour qui soient plus lisibles
Voir https://github.com/itaysk/kubectl-neat
```shell
sudo apt install -y build-essential
sudo snap install go  --classic
wget https://github.com/itaysk/kubectl-neat/archive/v2.0.3.tar.gz
tar -zxvf v2.0.3.tar.gz 
cd kubectl-neat-2.0.3/
make
sudo cp dist/kubectl-neat_linux_amd64 /usr/local/bin/kubectl-neat
```
## Usage avec un pipe et une redirection
```shell
cd ~/k8s-webforce3/lab-deployment
k get deployment nginx -o yaml | kubectl-neat  > first.yaml
```

## Deletion and creation using declarative command
```shell
k delete deployment nginx
k create -f first.yaml
# delete with a declarative command
k delete -f first.yaml 
```
## usage of dry-run
```shell
k create deployment two --image=nginx --dry-run=client -o yaml
```

## Expose
```shell
k expose -h 
k expose deployment nginx
vim first.yaml
#Add after name: nginx
ports:
- containerPort: 80
  protocol: TCP
k replace -f first.yaml
k get deployment
k expose deployment nginx
k get svc
k get ep nginx
```

## Scale
```shell
k get deploy nginx
k scale deployment nginx --replicas=3
k get pod
k delete pod nginx-xxxx
k get ep nginx
curl <ip>:80
k get pod -o wide
k scale deployment nginx --replicas=0
```

## Access from outside the cluster
```shell
k get po 
k exec nginx-xxxx --printenv | grep KUBERNETES
k get svc
k delete svc nginx
k expose deployment nginx --type=LoadBalancer
k get svc 
```

## Clean up 
```shell
k delete deployment nginx
k delete ep nginx
k delete svc nginx
```


