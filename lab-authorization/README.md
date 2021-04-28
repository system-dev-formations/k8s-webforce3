# lab-authorization

```shell
k create ns development 
k create ns production
k config get-contexts
sudo useradd -s /bin/bash DevDan
sudo passwd DevDan
openssl genrsa -out DevDan.key 2048
# commenting 
sudo vi /etc/ssl/openssl.cnf 
#RANDFILE = $ENV::HOME/.rnd
openssl req -new -key DevDan.key -out DevDan.csr -subj "/CN=DevDan/O=development"

sudo openssl x509 -req -in DevDan.csr -CA /etc/kubernetes/pki/ca.crt -CAkey \ 
/etc/kubernetes/pki/ca.key -CAcreateserial -out DevDan.crt -days 45

k config set-credentials DevDan --client-certificate=DevDan.crt --client-key=DevDan.key 
vi ~/.kube/config 
k config set-context DevDan-context  --cluster=kubernetes --namespace=development  --user=DevDan
k --context=DevDan-context get pods
k config get-contexts

k create -f role-dev.yaml 
k create -f rolebind.yaml

k --context=DevDan-context get pods
k --context=DevDan-context create deployment nginx --image=nginx

k create -f role-prod.yaml 
k create -f rolebindprod.yaml

k config set-context ProdDan-context  --cluster=kubernetes --namespace=production  --user=DevDan
kubectl --context=ProdDan-context get pods

k --context=ProdDan-context create deployment nginx --image=nginx
k -n production describe role dev-prod 
k -n development describe role developer 

# Admission controllers
```
sudo grep admission /etc/kubernetes/manifests/kube-apiserver.yaml
```