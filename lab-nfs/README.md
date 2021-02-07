# Lab-NFS

```shell
sudo apt-get update 
sudo apt-get install -y nfs-kernel-server
sudo mkdir /opt/sfw
sudo chmod 1777 /opt/sfw
sudo bash -c 'echo software > /opt/sfw/hello.txt'
```
Add a line in /etc/exports
sudo vi /etc/exports
/opt/sfw/  *(rw,sync,no_root_squash,subtree_check)

sudo exportfs -ra

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
## Resource Quota
```shell
k delete deployments.apps nginx 
k delete pvc pvc-one 
k delete pv pvvol-1 
k create namespace small
k describe ns small 
k -n small create PVol.yaml 
k -n small create -f PVol.yaml 
k -n small create -f pvc.yaml 

k -n small create -f storage-quota.yaml 
k describe ns small
k -n small create -f nfs-rsquota.yaml 
k get deployments.apps -n small
k -n small describe deployments.apps nginx 
k -n small get pod
k -n small describe pod nginx-xxxx
k describe ns small

sudo dd if=/dev/zero of=/opt/sfw/bigfile bs=1M count=300
k describe ns small
du -h /opt
k -n small get deployments.apps 
k -n small delete deployments.apps nginx
k describe ns small
k -n small get pvc
k -n small delete pvc pvc-one 
k -n small get pv 


```