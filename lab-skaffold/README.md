# Lab-skaffold
## install
```shell
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64
chmod +x skaffold
sudo mv skaffold /usr/local/bin
skaffold version
```

## Examples
```shell
git clone https://github.com/GoogleContainerTools/skaffold.git
cd skaffold
cd getting-started
# change the image name in the file skaffold.yaml and k8s-pod.yaml
skaffold dev
# open another ssh session 
# change main.go as 
fmt.Println("Hello world! update")
# Check 


```
Basic commands     
![skaffold_commands](screenshot/skaffold_commands.png)