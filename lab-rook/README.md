# Lab ROOK
```shell script
  k --namespace kube-system create sa tiller
  k create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
  wget https://get.helm.sh/helm-v3.0.2-linux-amd64.tar.gz
  tar -zxvf helm-v3.0.2-linux-amd64.tar.gz
  cd linux-amd64/
  sudo cp helm /usr/local/bin/helm
  cd
  helm help     # check
  k create ns rook-ceph  # create a namespace
  helm repo add rook-release https://charts.rook.io/release
  helm install rook --namespace rook-ceph rook-release/rook-ceph 
  watch kubectl get pod -A -o wide
```