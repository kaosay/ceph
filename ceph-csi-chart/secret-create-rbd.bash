
kubectl create secret generic csi-rbd-secret --namespace=ceph-rbd --from-literal=userID=admin --from-literal=userKey=AQD
