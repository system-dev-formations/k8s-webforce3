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
# check 

```
# Commands 
```shell
 k get node
 k taint nodes master  bubba=value:PreferNoSchedule
```

k create -f taint.yaml
k get pod -o wide
k delete -f taint.yaml

k get pod
k taint nodes afip-k8s-master-ref bubba=value:PreferNoSchedule
k describe nodes | grep Taint
k create -f taint.yaml
k get pod -o wide
k delete -f taint.yaml
k taint nodes afip-k8s-master-ref bubba-
k describe nodes | grep Taint
k describe nodes | grep Taint
k get pod -o wide
k taint nodes afip-k8s-node1-ref bubba=value:NoSchedule
k create -f taint.yaml
k get pod -o wide
k delete -f taint.yaml
k taint nodes afip-k8s-node1-ref bubba-
k taint nodes afip-k8s-node1-ref bubba=value:NoExecute
k get pod -o wide
k taint nodes afip-k8s-node1-ref bubba-
k get pod -o wide
k create -f taint.yaml
k get pod -o wide
k drain afip-k8s-node1-ref
k get pod -o wide
k drain afip-k8s-node1-ref
k get pod -o wide
k delete -f taint.yaml
k create -f taint.yaml
k get pod -o wide
k create -f taint.yaml
k get pod -o wide
k delete  -f taint.yaml
k uncordon afip-k8s-node1-ref
k create -f taint.yaml
k get pod -o wide

