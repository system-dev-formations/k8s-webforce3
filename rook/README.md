# Rook 
## install rook 
```shell
wget https://github.com/rook/rook/archive/v1.5.6.tar.gz
tar -zxvf v1.5.6.tar.gz
```


All commands
```shell
k create -f common.yaml 
k create -f operator.yaml 
k -n rook-nfs-system get pod -w
  110  k create -f psp.yaml 
  111  k create f rbac.yaml 
  112  k create -f rbac.yaml 
  113  ll
  114  cat nfs-xfs.yaml 
  115  vi nfs-xfs.yaml 
  116  k create -f nfs-xfs.yaml 
  117  k -n rook-nfs get nfsservers.nfs.rook.io
  118  k -n rook-nfs get pod -l app=rook-nfs
  119  ll
  120  k create -f busybox-rc.yaml 
  121  k create -f web-rc.yaml 
  122  k  get pod -l app=nfs-demo
  123  k  get pod -l app=nfs-demo -w
  124  k delete -f web-rc.yaml 
  125  k delete -f busybox-rc.yaml 
  126  ll
  127  k create -f sc.yaml 
  128  k create -f pvc.yaml 
  129  k delete -f busybox-rc.yaml 
  130  k create -f busybox-rc.yaml 
  131  k create -f web-rc.yaml 
  132  k  get pod -l app=nfs-demo -w

```