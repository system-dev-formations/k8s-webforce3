# Exemple de gestion de base donnee avec ETCD
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
