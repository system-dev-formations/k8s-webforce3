# Lab-stress
## default configuration for stress
```shell
k create deployment hog --image systemdevformations/stress
k get deploy
k describe deploy hog
k get deployment hog -o yaml | kubectl-neat > hog.yaml 
vi hog.yaml


```