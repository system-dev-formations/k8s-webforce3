# Taints and tolerations
Node affinity, is a property of Pods that attracts them to a set of nodes (either as a preference 
or a hard requirement). Taints are the opposite -- they allow a node to repel a set of pods.  
Tolerations are applied to pods, and allow (but do not require) the pods to schedule onto 
nodes with matching taints.  
Taints and tolerations work together to ensure that pods are not scheduled onto inappropriate nodes.
One or more taints are applied to a node; this marks that the node should not accept
any pods that do not tolerate the taints.  

## Remove taint on master to allow pod to be set up 
```shell
# check 

```