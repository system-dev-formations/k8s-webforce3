# Minikube for AWX  
```shell
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64   && chmod +x minikube
sudo mv minikube /usr/local/bin
sudo apt-get install -y conntrack
root@xxx:/usr/sbin# cd /usr/bin/
root@xxx:/usr/bin# ln -s /usr/sbin/conntrack conntrack
minikube start --cpus=4 --memory=4g addons=ingress  --driver=none
## minikube start --nodes 2 -p multinode-demo
minikube kubectl get nodes
minikube kubectl get pods
minikube status
minikube kubectl -- apply -f https://raw.githubusercontent.com/ansible/awx-operator/devel/deploy/awx-operator.yaml
mkdir  minikube-awx
cd minikube-awx
vi myawx.yml
# add these lines
---
apiVersion: awx.ansible.com/v1beta1
kind: AWX
metadata:
  name: awx
spec:
  tower_ingress_type: Ingress
  
minikube kubectl apply -- -f myawx.yml 
minikube kubectl get pod
minikube service awx-service --url
minikube kubectl -- get secret awx-admin-password -o jsonpath='{.data.password}' | base64 --decode
```