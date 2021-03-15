# Installer Helm
##Installation de binaire helm
```shell script
   wget https://github.com/helm/helm/archive/v3.4.2.tar.gz
   tar -zxvf v3.4.2.tar.gz
    cd helm-3.4.2/
    make
    cd bin
   sudo cp  helm /usr/local/bin/helm
   cd ~/k8s-webforce3/lab-helm
   helm version
```
## Chercher un chart dans le repository hub 
``` helm search hub wordpress```  

## ajouter un repo et installer mysql chart
```shell script
     helm repo add bitnami https://charts.bitnami.com/bitnami
    helm repo add stable https://charts.helm.sh/stable
    helm search repo stable
    helm repo update
    k create -f mysqldb-hostpath.yaml
    k get pv
    k create -f mysqldb-pvc.yaml
    k get pvc
    helm install  mysql --set mysqlRootPassword=rootpassword,mysqlUser=mysql,mysqlPassword=my-password,mysqlDatabase=mydatabase,persistence.existingClaim=mysql-pvc stable/mysql
    k get pod
    k get pod -w #  k is an alias so it can't be used in a command shell using watch
    k get pod --watch 
```
## Get mysql admin password
```shell script
   MYSQL_ROOT_PASSWORD=$(kubectl get secret --namespace default mysql -o jsonpath="{.data.mysql-root-password}" | base64 --decode; echo)
   echo $MYSQL_ROOT_PASSWORD
```
## se connecter a Mysql en dehors du cluster 
```shell script
     sudo apt-get install -y mysql-client-core-5.7
     k port-forward svc/mysql 3306
     # in another shell 
     mysql -h 127.0.0.1 -P 3306 -u root -p
``` 

