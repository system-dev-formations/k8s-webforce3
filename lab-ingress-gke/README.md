# lab-ingress-gke



```
## deploy 2 examples
```shell
k apply -f hello-kubernetes-first.yaml
k apply -f hello-kubernetes-first-service.yaml
k apply -f hello-kubernetes-second.yaml
k apply -f hello-kubernetes-second-service.yaml
k apply -f hello-kubernetes-ingress.yaml
```

View the ingress: 
```shell
k get ingress my-ingress -o yaml
```
Get the external HTTP load balancer IP
Test
```shell
curl <ip>
curl <ip>/kube
```