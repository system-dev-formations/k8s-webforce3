# GKE_CONTROLLER vm for a K8s-gke classroom
```shell script
sudo yum -y update
sudo vi  /etc/yum.repos.d/google-cloud-sdk.repo
[google-cloud-sdk]
name=Google Cloud SDK
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
sudo yum install -y google-cloud-sdk
gcloud init --console-only
gcloud container clusters get-credentials afip-test-k8s
sudo yum install epel-release
yum install snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install kubectl --classic
sudo ln -s /var/lib/snapd/snap/bin/kubectl /usr/local/bin/kubectl
kubectl get nodes
cd .kube
```