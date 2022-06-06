#!/bin/bash
#创建组
groupadd -g 40000 adminuser
#创建用户
useradd -G 40000 natasha 
useradd -s /sbin/nologin sarah
#创建密码
echo "redhat" | passwd --stdin sarah
echo "redhat" | passwd --stdin natasha 
