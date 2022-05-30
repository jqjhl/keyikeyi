#!/bin/bash
#备份yum
mkdir /etc/yum.repos.d/old
mv /etc/yum.repos.d/* /etc/yum.repos.d/old/
#获取yum源
curl -o /etc/yum.repos.d/Rhel-Base.repo https://ghproxy.com/https://raw.githubusercontent.com/jqjhl/keyikeyi/main/CentOS-8.repo
#清除缓存
yum clean all
#更新仓库信息
yum makecache
#安装httpd
yum -y install httpd
#关闭防火墙
systemctl stop firewalld
#重启httpd
systemctl restart httpd
