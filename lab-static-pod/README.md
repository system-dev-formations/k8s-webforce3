# Lab static-Pod

select a node and connect on it using ssh
```shell
cd ~/k8s-webforce3/lab-static-pod
sudo mkdir /etc/kubelet.d
sudo cp static-web.yaml /etc/kubelet.d
```
Change kubelet daemon parameter
```shell
sudo vi /lib/systemd/system/kubelet.service 
# change line as
ExecStart=/usr/bin/kubelet --pod-manifest-path=/etc/kubelet.d/
# save it 
sudo systemctl daemon-reload
sudo systemctl restart kubelet


```
## Troubleshooting 
Find the kubelet process with its arguments
```shell
ps -eo args > report 
vi report
# command
 sudo /usr/bin/kubelet --bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet.conf --config=/var/lib/kubelet/config.yaml \ 
 --network-plugin=cni \
 --pod-infra-container-image=k8s.gcr.io/pause:3.2 --pod-manifest-path=/etc/kubelet.d/ &
sudo systemctl stop kubelet
sudo sh report

```


