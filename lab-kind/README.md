# <span style="color:blue">Kind</span> is <span style="color:blue">K</span>ubernetes <span style="color:blue">in</span> <span style="color:blue">D</span>ocker

## Pre-requisites on your VM
### Useful packages
```shell
sudo apt-get update  # update links to repos
sudo apt-get -y install git wget htop iotop iftop # install git and monitoring tools
sudo apt-get -y install python3 python3-venv # install python3 and virtualenv
sudo apt-get -y install build-essential   # need for installing docker-compose
sudo apt-get -y install python3-dev libxml2-dev libxslt-dev libffi-dev # need for installing docker-compose
htop  # check your vm config
Crtl-c  # exit 
``` 
### install docker
```shell script
git clone https://github.com/system-dev-formations/k8s-webforce3.git
cd k8s-webforce3/lab-kind
python3 -m venv venv  # set up the module venv in the directory venv
source venv/bin/activate  # activate the virtualenv python
pip3 install wheel  # set for permissions purpose
pip3 install --upgrade pip # update pip3
pip3 install ansible # install ansible 
pip3 install requests # extra packages
ansible --version # check the version number # should be the latest 2.12.6
ansible-playbook -i inventory_kind install_docker_ubuntu.yml --limit local  # run the playbook for installing docker
# close your IDE and start again 
cd k8s-webforce3/lab-kind
source venv/bin/activate
docker ps 
```

```shell
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.14.0/kind-linux-amd64
chmod +x ./kind   # set kind as an executable
sudo mv ./kind /usr/local/bin/kind # move kind to a suitable directory 
kind version  # Check
```
## Start a cluster with kubernetes image version 
Check on docker hub to get a valid image version   
```shell
kind create cluster --name=kube --config kind-config.yml --image kindest/node:v1.24.1
# kind create cluster --name=kube --config kind-config.yml --image kindest/node:v1.18.19
```
Note: after running kind a directory .kube is created


## Create a container as a working environment
```shell
#cd ~/k8s-webforce3/lab-rollingupdate
#docker run -it --rm --name work -v ${HOME}:/root/ -v ${PWD}:/work -w /work --net host alpine sh 

## install kubectl 
#apk add --no-cache --virtual .build-deps bash gcc musl-dev openssl go curl vim
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
alias k='kubectl'
````


## delete cluster 
```shell
kind delete cluster --name kube
```