# Argo CD

## install argo CD server
```shell script
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```
## install argocd cli
```shell script
 VERSION=$(curl --silent "https://api.github.com/repos/argoproj/argo-cd/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$VERSION/argocd-linux-amd64
sudo chmod +x /usr/local/bin/argocd
argocd version 
```

## Get Argo CD Password , user is admin and set the password admin 
```shell
kubectl -n argocd patch secret argocd-secret -p '{"stringData": {
"admin.password": "$2a$10$fulVqTM1sbnreOjh9NemLepWXW4ZPCjP/LjfAJ4aHL2JWVXL8OLVe",
"admin.passwordMtime": "'$(date +%FT%T%Z)'"
}}'

# kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2
```

## apply the project
```shell
k apply -f project.yaml
k apply -f apps.yaml
```
## Explain
Go to the repo  https://github.com/system-dev-formations/argocd-previews.git 
cd helm
vi templates/namespace.yaml
k get ns 

## Check the exports
```
cat exports
# in this file
export PR_ID=1  # Pull-request ID
export REPO=devops-toolkit # where the pull-request was created
export APP_ID=pr-$REPO-$PR_ID # unique app id application
export IMAGE_TAG=2.6.2  # image tag
export HOSTNAME=$APP_ID.$INGRESS_HOST.xip.io # ingress
source exports  # set up all variables
```
##  Install a  kyml tool
```shell
sudo curl -sfL -o /usr/local/bin/kyml https://github.com/frigus02/kyml/releases/download/v20190906/kyml_20190906_linux_amd64 \
&& sudo chmod +x /usr/local/bin/kyml
```
## Convert the preview.yaml file
```shell
source exports
cat preview.yaml | kyml tmpl -e REPO -e APP_ID -e IMAGE_TAG -e HOSTNAME \ 
| tee ~/argocd-previews/helm/templates/$APP_ID.yaml
```

## Change the file pr-devops-tools-1.yaml in the argocd_previews repo 
```shell
git add . 
git commit -m "change base file"
git push 
```


