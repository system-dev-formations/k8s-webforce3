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
  kubectl get ep nginx
  kubectl describe pod nginx-xxxx | grep Node:
  k get pod -o wide 
  kubectl scale deployment nginx --replicas=3
  # arreter tous les pods
  kubectl scale deployment nginx --replicas=0
  kubectl get deployment nginx
  k get ep nginx 
  kubectl exec nginx-xxxxxx -- printenv |grep KUBERNETES
  kubectl delete svc nginx
  kubectl expose deployment nginx --type=LoadBalancer
  kubectl get svc
  k get svc -A
  ssh -L 12000:51.68.5.225:30000 etudiant@localhost 
```
## CPU and Limits
  kubectl create deployment hog --image vish/stress
   k get deployment hog
   k describe deployment hog
   kubectl get deployment hog --export -o yaml > hog.yaml
   k replace -f hog.yaml
   k get po 
   k logs hog-xxxxxxxxxx
   k delete deployments.apps hog
   k create -f hog.yaml
   k get pod
   k logs hog-7867569d4b-tng4s
   kubectl scale deployment hog --replicas=10
   ## Namespaces
   kubectl create namespace low-usage-limit
   k get namespace
   k  --namespace=low-usage-limit create -f low-resource-range.yaml
   k get LimitRange
   k get LimitRange -A
   k -n low-usage-limit create deployment limited-hog --image vish/stress
   kubectl -n low-usage-limit get pods
   k -n low-usage-limit get pod limited-hog-xxxxx -o yaml
   k get rs
   K get rs -A 
   k -n low-usage-limit delete deploy limited-hog 
   k  create -f rs.yaml
   k describe rs rs-one
