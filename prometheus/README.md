# kubernetes-prometheus
## Configuration files 
For setting up prometheus monitoring on Kubernetes cluster.

Hit the following commands: 
```shell script
 k create -f clusterRole.yaml
 k create -f config-map.yaml
 k create -f prometheus-deployment.yaml
 k create -f prometheus-service.yaml
```
