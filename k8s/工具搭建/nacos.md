mkdir ~/nacos
git clone https://github.com/nacos-group/nacos-k8s.git

cd nacos-k8s

# 在1.16版本中 修改 apiVersion: apps/v1
kubectl create -f deploy/nfs/deployment.yaml

#创建 NFS StorageClass
kubectl create -f deploy/nfs/class.yaml
# 验证NFS部署成功
kubectl get pod -l app=nfs-client-provisioner

