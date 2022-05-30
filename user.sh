#!/bin/bash
#创建组
groupadd -g 20000 mytest
#创建用户
useradd -G 20000 abc 
useradd -s /sbin/nologin zzz
#创建密码
echo "centos" | passwd --stdin abc
echo "centos" | passwd --stdin zzz