# k8s-webforce3

## Check
```shell script
  kubectl get nodes
  kubectl get node
  kubectl get node -o wide

## Deployment example
  kubectl create deployment nginx --image=nginx
  kubectl get deployments
  kubectl describe deployment nginx
  kubectl get events
  kubectl get deployment nginx -o yaml 
  kubectl get deployment nginx -o yaml > first.yaml
  epurer les lignes necessaires
  k create -f first.yaml
  kubectl get deployment nginx -o yaml > second.yaml
  kubectl create deployment two --image=nginx --dry-run -o yaml
  kubectl get deployment nginx --export -o yaml
  kubectl get deployment nginx --export -o json
  k expose -h
  kubectl expose deployment/nginx
  kubectl replace -f first.yaml
  kubectl get deploy,pod
  kubectl expose deployment/nginx
  kubectl get svc nginx

```