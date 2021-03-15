# Lab configmap
```shell
mkdir primary
echo c > primary/cyan
echo m > primary/magenta 
echo y > primary/yellow
echo k > primary/black
echo "know as key" >> primary/black
echo blue > favorite
cat primary/black
k create configmap colors --from-literal=test=black --from-file=./favorite --from-file=./primary/
k get cm colors
k get cm
k get cm colors -o yaml
```

and

```shell
k create -f simpleshell.yaml
k get pod
k exec -it shell-demo -- /bin/bash -c 'echo $ilike'
```
modify script

```k exec -it shell-demo -- /bin/bash -c 'env'```

```shell
k create -f car-map.yaml
k get cm
k delete pod shell-demo
k create -f simpleshell-1.yaml
k exec -it shell-demo -- /bin/bash -c 'df -ha | grep car'
k exec -it shell-demo -- /bin/bash -c 'cat /etc/cars/car.body'
k exec -it shell-demo -- /bin/bash -c 'cat /etc/cars/car.model'
```