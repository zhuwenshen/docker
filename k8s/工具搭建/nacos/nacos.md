mkdir ~/nacos
git clone https://github.com/nacos-group/nacos-k8s.git

cd nacos-k8s


# 修改mysql-nfs.yaml中的nfs地址并创建文件夹
kubectl apply -f mysql-nfs.yaml

kubectl apply -f nacos-pvc-nfs.yaml

# 映射出去
kubectl apply -f nacos-svc.yaml

