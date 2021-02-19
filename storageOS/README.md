# Step by Step
Reference :   
https://docs.storageos.com/docs/self-eval/  
https://docs.storageos.com/docs/operations/firstpvc/  
git clone https://github.com/storageos/use-cases.git

BEWARE: IF YOU HAVE ALREADY INSTALL STORAGEOS DO THIS
```shell
 wget  https://github.com/storageos/cluster-operator/releases/download/v2.3.3/storageos-operator.yaml
 k delete -f storageos-operator
 k delete ns storageos-operator
```

## Install etcd operator
```shell
cd
git clone https://github.com/coreos/etcd-operator.git
cd k8s-webforce3/storageOS
source exports
k create namespace $NAMESPACE
cd ~/etc-operator/example/rbac/
./create-role.sh
cd ~/k8s-webforce3/storageOS
k -n $NAMESPACE create -f deployment.yaml
k -n $NAMESPACE create -f etcd-resource.yaml
kubectl create -f https://github.com/storageos/cluster-operator/releases/download/v2.3.3/storageos-operator.yaml
k get pod -n storageos-operator
k create -f storageos-secret.yaml
k create -f storageos-cluster-resource.yaml
```
Deploy the StorageOS CLI as a container
```shell
kubectl -n kube-system run \
--image storageos/cli:v2.3.3 \
--restart=Never                          \
--env STORAGEOS_ENDPOINTS=storageos:5705 \
--env STORAGEOS_USERNAME=admin         \
--env STORAGEOS_PASSWORD=12345678       \
--command cli                            \
-- /bin/sh -c "while true; do sleep 999999; done"
```


Create a PVC
```shell
k create -f storageos-pvc.yaml
kubectl -n kube-system exec -it cli -- storageos get volumes
```

Create a Pod
```shell
k create -f storageos-example-pod.yaml
k get pod d1 -w
exit
k exec -it d1 -- bash
echo Hello world! > /mnt/hello
cat /mnt/hello
exit
```
Delete/Recreate a Pod and check 
```shell
k delete pod d1
k create -f storageos-example-pod.yaml
k exec -it d1 -- cat /mnt/hello
```

