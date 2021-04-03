# Lab-NFS

```shell
sudo apt-get update   # update package
sudo apt-get install -y nfs-kernel-server  # install nfs packages
sudo mkdir /opt/sfw   # create shared directory
sudo chmod 1777 /opt/sfw   # change to executable mode
sudo bash -c 'echo software > /opt/sfw/hello.txt'  # create a test file
#Add a line in /etc/exports  
sudo vi /etc/exports
/opt/sfw/  *(rw,sync,no_root_squash,subtree_check)
sudo exportfs -ra   # reload for the change takes effect
```

## Install nfs on the node1
```shell
sudo apt-get update 
sudo apt-get -y install nfs-common  # add  nfs clien package
showmount -e <master_address_ip>   # check whether the shared mount works
```
see all scripts
```shell
k create -f mypostgres-pv.yaml   # create a persistentvolume
k get pv     # check persistentVolume
k get pvc    # check persistentVolumeClaim 
k create -f mypostgres-pvc.yaml   # create a persistentvolume
k get pvc   # Check 
k create -f nfs-pod.yaml  # install a pod connected to the pvc
k get pods    # Check 
k describe pod nginx-xxxxx  # verify 
k get pvc   # check 
```
## Resource Quota
```shell
k delete deployments.apps nginx-nfs 
k delete pvc pvc-one 
k delete pv pvvol-1 
k create namespace small
k describe ns small 
k -n small create mypostgres-pv.yaml 
k -n small create -f mypostgres-pv.yaml 
k -n small create -f mypostgres-pvc.yaml 

k -n small create -f storage-quota.yaml 
k describe ns small
k -n small create -f nfs-rsquota.yaml 
k get deployments.apps -n small
k -n small describe deployments.apps nginx-nfs 
k -n small get pod
k -n small describe pod nginx-xxxx
k describe ns small

sudo dd if=/dev/zero of=/opt/sfw/bigfile bs=1M count=300
k describe ns small
du -h /opt
k -n small get deployments.apps 
k -n small delete deployments.apps nginx-nfs
k describe ns small
k -n small get pvc
k -n small delete pvc pvc-one 
k -n small get pv 
# see the status set to released
k -n small delete pv pvvol-1 
k create -f mypostgres-pv.yaml 
kubectl patch pv pvvol-1 -p {"spec":{"persistentVolumeReclaimPolicy":"Delete"}}
# see reclain policy is set to Delete
k describe ns small
k -n small create -f mypostgres-pvc.yaml
k describe ns small
k -n small delete resourcequotas storagequota
k describe ns small
k -n small  create -f nfs-pod.yaml


```