# The etcd Operator
Un CR est un endpoint nomme dans Kubernetes API, un CRD etcdclusters.etcd.database.coreos.com  
represent le nouveau type d'endpoint.  
Nous allons cree un nouveau type d'objet Kubernetes, EtcdCluster

Editez le fichier etc-operator-crd.yaml 
 ```commandline
k create -f etcd-operator-crd.yaml 
```
Un simple script pour faire une entree dans le Service-Account
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
L'operator est un controleur particulier qui s'execute dans un pod.  
il surveille l'EtcdCluster CR defini precedement. le fichier de deployment contient 
les details pour executer l'Operator.  
On a decrit ce que l'etcd cluster doit etre dans le CR une fois que l'operator est actif. 

```commandline
k create -f etcd-operator-deployment.yaml
```
 
Vous devez declarer un EtcdCluster avec l'etat qui doit avoir. Pour cela vous fournissez de values
la size et le version 

```commandline
k create -f etcd-cluster-cr.yaml
```

Maintenant nous avons un etcd cluster qui fonctionne. 
L'operator etcd a cree un service Kubernetes dans l'ectd cluster namespace.

```
kubectl get services --selector etcd_cluster=example-etcd-cluster
```

Verification 
Nous pouvons utiliser le client etcd dans le cluster. la commande suivant permet de ce connecter 
au ectd client. 

```shell
kubectl run --rm -i --tty etcdctl --image quay.io/coreos/etcd \
--restart=Never -- /bin/sh
```
Utilisation normale de la base cle/valeur etcd
```shell
export ETCDCTL_API=3
export ETCDCSVC=http://example-etcd-cluster-client:2379
etcdctl --endpoints $ETCDCSVC put foo bar
etcdctl --endpoints $ETCDCSVC get foo
```

Scaling
Changez la valeur de size de 3 a 4 et 
```shell
kubectl apply -f etcd-cluster-cr.yaml
```
Trouver un membre etcd qui est en echec
```shell
kubectl get pods -l app=etc
```



