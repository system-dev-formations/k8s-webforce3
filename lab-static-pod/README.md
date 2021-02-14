# Lab static-Pod

select a node and connect on it
```shell
cd ~/k8s-webforce3/lab-static-pod
sudo mkdir /etc/kubectl.d
sudo cp static-web.yaml /etc/kubectl.d
```
Change kubelet daemon parameter
```shell
sudo vi /lib/systemd/system/kubelet.service 
# change line as
ExecStart=/usr/bin/kubelet --pod-manifest-path=/etc/kubelet.d/
# save it 
sudo systemctl stop kubelet
sudo systemctl daemon-reload
sudo systemctl start kubelet
```

