# Exemple de gestion de la base de donnees avec ETCD 

## A faire sur un noeud, pas sur le master 
```shell
sudo snap install go --classic
wget https://github.com/etcd-io/etcd/archive/refs/tags/v3.5.0.tar.gz
tar -zxvf v3.5.0.tar.gz
cd etcd-3.5.0
./build
cd bin
./etcd &
./etcdctl put key1 value1
./etcdctl get key1
```

```scp etcdctl ubuntu@master:/home/ubuntu``` 

## Si vous avez acces au master, vous pouvez voir les donnees de la base ETCD
```shell
sudo ETCDCTL_API=3 ./etcdctl --endpoints 127.0.0.1:2379 --cacert /etc/kubernetes/pki/etcd/ca.crt \
--cert /etc/kubernetes/pki/etcd/server.crt \
--key /etc/kubernetes/pki/etcd/server.key get / --prefix --keys-only
```

