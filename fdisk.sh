#!/bin/bash
#创建分区
fdisk /dev/sda <<EOF
n
p



w
EOF
#创建物理卷
pvcreate /dev/sda1
#创建卷组
vgcreate datastore /dev/sda1
#创建逻辑卷
lvcreate -L 600M -n sw datastore
#格式化
mkfs -t xfs /dev/tmpstore/database
#创建挂载点
mkdir /mnt/database
#挂载
mount /dev/datastore/database /mnt/database
#开机挂载
echo "/dev/datastore/database /mnt/database xfs defaults 0 0" >>/etc/fstab

