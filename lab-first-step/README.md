# Lab-first-step

Fork and clone this repo to learn how to set up a cluster for training purpose.
https://github.com/crunchy-devops/install-kubernetes-lunanode.git
In the playbook these lines have been added at the end of the .bashrc file 
```shell
alias k = 'kubectl'
source <( kubectl completion bash | sed s/kubectl/k/g)
```

As soon as your cluster is set up you can check it but running the following commands.

```shell
k get node   # get list of nodes
k describe node  <node_name> # detail of nodes
k get nodes  # usage of plurals names
k get node -o wide # more info
```
The master won’t allow non-internal pods by default for security reasons.    
Allow the master server to run non-infrastructure pods. 
The master node begins tainted for security and performance reasons.    
We will allow usage of the node in the training environment, but this step may be skipped in a production  
environment.

```shell
k describe node | grep -i taint  # get taint
k taint nodes --all node-role.kubernetes.io/master-  # remove taint
# check 
k describe node | grep -i taint  # check if a taint is present
```
Determine if the DNS and CNI (Container Network Interace) are ready for use.   
```shell
k get pods -A
```
Create a new deployment, which is an Kubernetes object while will deploy and monitor 
an application in a container.  
Verify it is running and the desired number of container matches the available.  

```shell
k create deployment nginx --image=nginx
```
View the details of the deployment.   
Remember auto-completion will work for sub-commands and resources as well.
```shell
k describe deployment nginx
```
View the basic steps the cluster took in order to pull and deploy the new application. You should see several lines of
output with newer events at the top.
```shell
k get events
```

You can also view the output in yaml format, which could be used to create this deployment again or new deployments.
Get the information but change the output to yaml. Note that halfway down there is status information of the current
deployment.
```shell
k get deployment nginx -o yaml  # see the yaml file
k get deployment nginx -o yaml > first.yaml  # save the yaml file
k delete deployment nginx 
k create -f first.yaml
```
## Usage of kubectl-neat for clean up yaml file
see https://github.com/itaysk/kubectl-neat
```shell
sudo apt install -y build-essential
wget https://github.com/itaysk/kubectl-neat/archive/v2.0.3.tar.gz
tar -zxvf v2.0.3.tar.gz 
cd kubectl-neat-2.0.3/
make
# don't worry about the error in the test-e2e
sudo cp dist/kubectl-neat_linux_amd64 /usr/local/bin/kubectl-neat
```
## Use a linux pipe and redirection
```shell
k get deployment nginx -o yaml | kubectl-neat  > second.yaml
```
## Usage of dry-run 
```shell
k create deployment two --image=nginx --dry-run=client -o yaml
```

## Expose a service
The newly deployed nginx container is a light weight web server. We will need to create a service to view the default
welcome page. Begin by looking at the help output. Note that there are several examples given, about halfway through
the output.
```shell
k expose -h
k expose deploy nginx
# open file second yaml and and port and protocol
```
Due to how the object was created we will need to use replace to terminate and create a new deployment.
```shell
k replace -f second.yaml
```

Try to expose the resource again. This time it should work.
```shell
k expose deploy nginx # Expose the deployement
k get svc nginx  # Check if the service is there
k get ep nginx   # find the endpoint
```

## Scale up 
Now scale up the deployment from one to three web servers.
```shell
k scale deploy nginx --replicas=3  # scale up to 3 web servers
k delete pod <pod_name>  # delete a pod and see what's happen
k get ep nginx
k scale deploy nginx --replicas=0  # stop all pods
k scale deploy nginx --replicas=1  # stop all pods
```

## Access from the outside world
```shell
k get svc
k delete svc nginx
k expose deploy nginx --type=NodePort
k get svc   # get a port number greater than 30000 

```

