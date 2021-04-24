# Google-cloud-sdk on Centos
On you vm type: 
```shell script
 sudo yum update
 sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-sdk]
name=Google Cloud SDK
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
 EOM
 yum install google-cloud-sdk
 gcloud init --console-only
 gcloud container clusters get-credentials prow-xxxx --zone us-west1-b --project platinum-xxxxxx
 k get nodes
```

Connect using ssh to a node  
```shell script
 gcloud compute ssh gke-prow-crunchydevops-default-pool-6b1cbaba-cw2b
```

Stop the cluster   
```shell script
 gcloud container clusters resize cluster-x --num-nodes=0 --zone europe-west1-b
```

Set kubectl credentials to a specific cluster  
```shell script
 gcloud container clusters get-credentials cluster-x
```

## Google-cloud sdk on Ubuntu  
```shell
sudo apt update
sudo snap install google-cloud-sdk  --classic
gcloud auth login
gcloud config set project platinum-219712
gcloud container clusters get-credentials cluster-x --zone europe-west1-b --project platinum-219712
sudo snap install kubectl --classic
kubectl get nodes
kubectl get nodes -o wide
kubectl top nodes
kubectl top pod
gcloud compute ssh gke-cluster-1-default-pool-db9c41a9-d2jv --zone europe-west1-b
```

# Gestion de la montee de version sous GCP 
gcloud container node-pools describe default-pool --cluster cluster-2 --zone europe-west1-b