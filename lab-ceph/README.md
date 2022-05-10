git clone --single-branch --branch master https://github.com/rook/rook.git
cd rook/deploy/examples
helm repo add rook-stable https://charts.rook.io/stable
helm search repo rook-stable
helm install --name rook --namespace rook-ceph-system rook-stable/rook-ceph