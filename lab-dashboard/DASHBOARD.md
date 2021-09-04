# Utiliser le Dashboard

## Pre-requis ajoutez ces lignes dans votre .bashrc
```shell
alias k = 'kubectl'
source <( kubectl completion bash | sed s/kubectl/k/g)
```
## Set up the dashboard
```shell
k apply -f recommended.yaml 
k apply -f dashboard-adminuser.yaml
k get svc -A  # verifier l'adresse externe  ou votre remote vm et le port superieur a 30000
k get svc -A --watch 
```


## Get the dashboard token
```shell script
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret |
    grep admin-user | awk '{print $1}' )
        
     
```
## Dans votre navigateur firefox 
Tapez l'adresse IP de votre cluster et le port d'ecoute de votre dashboard. 
ou attendez d'obtenir une adresse de kubernetes  
Comme vous n'avez pas de certificat SSL valide il faut forcer la connexion dans votre navigateur.


