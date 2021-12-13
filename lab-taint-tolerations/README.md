# Taints and tolerations
Node affinity, is a property of Pods that attracts them to a set of nodes (either as a preference 
or a hard requirement). Taints are the opposite -- they allow a node to repel a set of pods.  
Tolerations are applied to pods, and allow (but do not require) the pods to schedule onto 
nodes with matching taints.  
Taints and tolerations work together to ensure that pods are not scheduled onto inappropriate nodes.
One or more taints are applied to a node; this marks that the node should not accept
any pods that do not tolerate the taints.  

## Remove taint on master to allow pod to be set up 
Three sort of taints : Noschedule, PreferNoSchedule and NoExecute

```shell
# pre-requisites
docker ps | wc -l
cd lab-taint-tolerations
k get pod
k create -f taint.yaml 
k get pod
k get pod -o wide
# Check master , and nodes
docker ps | wc -l
k delete -f taint.yaml 
# Check master , and nodes
docker ps | wc -l


```
# Commands 
```shell
 k get node
 k get pod 
 k taint nodes k8s-teacher-node-1 bubba=value:PreferNoSchedule
 k describe node | grep Taint
 k create -f taint.yaml 
k get pod
k get pod -o wide
docker ps | wc -l
```

```shell
k delete -f taint.yaml
k taint nodes k8s-teacher-node-1 bubba-
k create -f taint.yaml 
k get pod
k get pod -o wide 
docker ps | wc -l
k taint nodes k8s-teacher-node-1 bubba=value:NoSchedule
k edit deployments.apps taint-deployment
# change replica to 10  
```
## Eviction 
k taint nodes k8s-teacher-node-1 bubba-
k taint nodes k8s-teacher-node-1 bubba=value:NoExecute

## back
k delete -f taint.yaml
k taint nodes k8s-teacher-node-1 bubba-

## drain 
k create -f taint.yaml
k drain k8s-teacher-node-1
k get nodes

# uncordon 
k uncordon k8s-teacher-node-1

## Declarative command
```shell
docker ps | wc -l 
k get nodes 
k label nodes teacher-node1 status=vip
k get nodes --show-labels
k label nodes teacher-node2 status=other
k get nodes --show-labels
k create -f vip.yaml
docker ps | wc -l
k get pod -o wide
# comment line 
k create -f vip.yaml
docker ps | wc -l
k create -f other.yaml
docker ps | wc -l
```


