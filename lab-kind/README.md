# <span style="color:blue">Kind</span> is <span style="color:blue">K</span>ubernetes <span style="color:blue">in</span> <span style="color:blue">D</span>ocker

```shell
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
chmod +x ./kind   # set kind as an executable
sudo mv ./kind /usr/local/bin/kind # move kind to a suitable directory 
kind version  # Check
```
## Start a cluster with kubernetes image version 
Check on docker hub to get a valid image version   
```shell
kind create cluster --name=kube --config kind-config.yml --image kindest/node:v1.22.2
```
Note: after running kind a directory .kube has been created

## get a working directory which contains some kubernetes objects
deploy lab-rollingupdate  

## Create a container as a working environment
```shell
cd ~/k8s-webforce3/lab-rollingupdate
docker run -it --rm --name work -v ${HOME}:/root/ -v ${PWD}:/work -w /work --net host alpine sh 

## install kubectl 
apk add --no-cache --virtual .build-deps bash gcc musl-dev openssl go curl vim
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
alias k='kubectl'
````
## Run lab rolling update
```shell
k create -f curl.yaml -n kube-public  # to set up curl command
k create -f frontend.yaml
k create -f webapp-service.yaml  
kubectl port-forward service/webapp-service 3500:8080 --address='0.0.0.0'
chmod +x curl-test.sh
/curl-test.sh
```
