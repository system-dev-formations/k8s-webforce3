# INGRESS.md
Set a ingress ip address
```shell script
kubectl apply -f  web-deployment.yaml
kubectl apply -f  web-service.yaml
kubectl apply -f  basic-ingress.yaml
kubectl get ingress basic-ingress
```
