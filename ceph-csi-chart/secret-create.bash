
kubectl create secret generic csi-cephfs-secret --namespace=ceph-csi --from-literal=adminID=admin --from-literal=adminKey=AQ
