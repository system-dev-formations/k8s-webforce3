# Utiliser le Dashboard
L'installation du dashboard est faite par le playbook ansible.  
[voir] (https://github.com/system-dev-formations/install-k8s-lunanode.git)  
c'est plus facile d'avoir l'alias k et la completion des commandes pour retrouver le port d'ecoute 
du dashboard de votre cluster Kubernetes. 

```k get svc -A```


## Obtenir le token de connexion au dashboard
```shell script
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret |
    grep admin-user | awk '{print $1}' )
```
## Dans votre navigateur firefox 
Tapez l'adresse IP de votre cluster et le port d'ecoute de votre dashboard.   
Comme vous n'avez pas de certificat SSL valide il faut forcer la connexion de votre navigateur.


