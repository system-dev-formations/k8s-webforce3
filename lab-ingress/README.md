# lab-ingress
## install golang and helm
```shell
cd
wget https://github.com/helm/helm/archive/v3.4.2.tar.gz
tar -zxvf v3.4.2.tar.gz
cd helm-3.4.2/
ll
cd 
wget https://golang.org/dl/go1.15.6.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.15.6.linux-amd64.tar.gz
cd helm-3.4.2/
sudo apt update
sudo apt build-essential
sudo apt install build-essential
source ~/.profile
go version
make
sudo cp helm  /usr/local/bin
helm version
```

## deploy 2 examples
```shell
k create -f hello-kubernetes-first.yaml
k create -f hello-kubernetes-second.yaml
```

## Install nginx helm chart
```shell
helm repo add stable https://charts.helm.sh/stable
helm search repo stable
helm repo update
helm install nginx-ingress stable/nginx-ingress --set controller.publishService.enabled=true
```



