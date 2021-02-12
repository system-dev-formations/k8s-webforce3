# Exemple de gestion de la base de donnees avec ETCD 

## A faire sur un noeud, pas dans le master 
```shell
sudo snap install go --classic
wget https://github.com/etcd-io/etcd/archive/v3.4.0.tar.gz
tar -zxvf v3.4.0.tar.gz
cd etcd-3.4.0
./build
go mod vendor
./build
./test
cd bin
./etcd &
./etcdctl put key1 value1
./etcdctl get key1
```
## Si vous avez acces au master, pour voir les cles de la base ETCD
```shell
sudo ETCDCTL_API=3 ./etcdctl --endpoints 127.0.0.1:2379 --cacert /etc/kubernetes/pki/etcd/ca.crt \
--cert /etc/kubernetes/pki/etcd/server.crt \
--key /etc/kubernetes/pki/etcd/server.key get / --prefix --keys-only
```

