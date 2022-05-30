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
vgcreate tmpstore /dev/sda1
#创建逻辑卷
lvcreate -L 600M -n sw tmpstore
#格式化
mkfs -t xfs /dev/tmpstore/sw
#创建挂载点
mkdir /mnt/tmpbase
#挂载
mount /dev/tmpstore/sw /mnt/tmpbase
#开机挂载
echo "/dev/tmpstore/sw /mnt/tmpbase xfs defaults 0 0" >>/etc/fstab

