sudo apt-get install -y nfs-kernel-server nfs-common  # 安装 NFS服务器端 安装 NFS客户端

# 添加 NFS 共享目录
sudo vim /etc/exports
#  # * 表示允许任何网段 IP 的系统访问该 NFS 目录
/root/nfs_root/ *(insecure,rw,sync,no_root_squash)


mkdir /root/nfs_root
sudo chmod -R 777 /root/nfs_root
sudo chown root:root /root/nfs_root/ -R   # root 为当前用户，-R 表示递归更改该目录下所有文件

systemctl enable rpcbind
systemctl enable nfs-server

# 启动 NFS 服务
#sudo /etc/init.d/nfs-kernel-server start    或者  
#sudo /etc/init.d/nfs-kernel-server restart
systemctl start rpcbind
systemctl start nfs-server
exportfs -r


# 测试

mkdir /root/nfsmount
# mount -t nfs $(nfs服务器的IP):/root/nfs_root /root/nfsmount
mount -t nfs 192.168.0.249:/root/nfs_root /root/nfsmount
# 写入一个测试文件
echo "hello nfs server" > /root/nfsmount/test.txt

umount /root/nfsmount