# Rook 
## install rook 
```shell
wget https://github.com/rook/rook/archive/v1.5.7.tar.gz
tar -zxvf v1.5.7.tar.gz 
cd rook-1.5.7/
cd cluster/examples/kubernetes/nfs/
```


All commands
```shell
k create -f common.yaml 
k create -f operator.yaml 
k -n rook-nfs-system get pod 
k create -f psp.yaml  
k create -f rbac.yaml  
k create -f nfs-xfs.yaml 
k -n rook-nfs get nfsservers.nfs.rook.io
k -n rook-nfs get pod -l app=rook-nfs
k create -f sc.yaml 
k create -f mypostgres-pvc.yaml  
k create -f busybox-rc.yaml 
k create -f web-rc.yaml 
k  get pod -l app=nfs-demo -w

```