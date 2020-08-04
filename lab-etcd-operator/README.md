# The etcd Operator
Un CR est un endpoint nomme dans Kubernetes API, un CRD etcdclusters.etcd.database.coreos.com  
represent le nouveau type de endpoint.
Nous allons cree une nouvelle type d'objet Kubernetes, EtcdCluster

Editez le fichier etc-operator-crd.yaml 
 ```commandline
k create -f etc-operator-crd.yaml 
```
Une simple script pour faire une entree dans le Service-Account
```commandline
k create etcd-operator-sa.yaml
```
Ajoutez un role au service-account pour cet operator. 
```commandline
k create -f etcd-operator-role.yaml
```
et le RoleBinding
```commandline
k create -f etcd-operator-rolebinding.yaml
```
L'operator est un particulier controleur qui s'execute dans un pod.
il surveille le EtcdCluster CR defini precedement. le fichier de deployment contient 
les details pour executer l'Operator. On a decrit ce que l'etcd cluster doit etre  
dans le CR une fois que l'operator est actif. 


 