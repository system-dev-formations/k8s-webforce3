# Lab monitoring with Prometheus et Grafana
## Installation 
```shell script
   git clone https://github.com/cesigit/kubernetes-prometheus.git
   cd kubernetes-prometheus
   k create namespace monitoring
   k create -f clusterRole.yaml
   k create -f config-map.yaml 
   k create -f prometheus-deployment.yaml 
   k create -f prometheus-service.yaml
```
## SSH tunnel 
Si vous avez des problemes avec les certifications entre votre localhost  
et votre master K8s distant, on peut mettre en place un SSH tunnel
```shell script
   ssh -L 12000:51.68.5.225:30000 etudiant@localhost 
```
12000 est votre port local   
51.68.5.225 est votre master distant  
30000 est le port sepcifique dans le service K8s en type loadbalancer  
le reste est votre user et machine locale  

## Premiers pas avec  Prometheus 
Allez dans le menu Status --> Targets

## Installer Grafana 
```shell script
    k create -f grafana-datasource-config.yaml 
    k create -f deployment.yaml
    k create -f service.yaml
```
User name :  admin  Mot de passe: admin  