# Robot shop stan 

```shell
git clone https://github.com/instana/robot-shop.git
cd robot-shop
cd K8s/helm
kubectl create ns robot-shop
helm install robot-shop --namespace robot-shop .
```