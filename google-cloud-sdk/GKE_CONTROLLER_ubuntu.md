# GKE_CONTROLLER_ubuntu vm for a K8s-gke classroom
```shell script
sudo apt-get update
wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-307.0.0-linux-x86_64.tar.gz
tar -zxvf google-cloud-sdk-307.0.0-linux-x86_64.tar.gz
cd google-cloud-sdk/
./install.sh
gcloud init --console-only
sudo snap install kubectl --classic
gcloud 
kubectl get nodes
cd .kube
```