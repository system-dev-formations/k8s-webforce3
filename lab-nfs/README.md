# Lab-NFS

```shell
sudo apt-get update 
sudo apt-get install -y nfs-kernel-server
mkdir /opt/sfw
sudo chmod 1777 /opt/sfw
sudo bash -c 'echo software > /opt/sfw/hello.txt'
```
Add a line in /etc/exports
/opt/sfw/  *(rw,sync,no_root_squash,subtree_check)

Install nfs on the node1
```shell
sudo apt-get -y install nfs-common
showmount -e <master_address_ip>
```
see all scripts
```shell
k create -f PVol.yaml
k get pv
k get pvc
k create -f pvc.yaml
k get pvc
k create -f nfs-pod.yaml
k get pods
k describe pod nginx-xxxxx
k get pvc
```