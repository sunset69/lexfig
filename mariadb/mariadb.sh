#!/bin/bash

# 定义要安装的软件列表
packages="mariadb-server"
logs="install.log"

#更新软件源
echo "更新软件源中..."
apt update > /dev/null
echo "软件源更新完成"

# 循环安装软件
for package in $packages
do
    echo "正在安装 $package ..."
    apt-get install -y $package >> $logs
    if [ $? -eq 0 ]; then
        echo "$package 安装成功！"
    else
        echo "$package 安装失败！"
    fi
    echo
    echo >> $logs
done

echo "查看mariadb状态"
systemctl status mariadb | head
echo

echo "初始化mariadb"
mysql_secure_installation

echo "添加远程访问用户"

echo "请输入远程用户用户名："
read username
echo "请输入远程用户密码："
read password

sqlCreateUser="create user '$username'@'localhost' identified by '$password';"
sqlGrant="grant all privileges on *.*  to '$username'@'%' identified by '$password';"
# echo $sqlCreateUser
# echo $sqlGrant

echo "use mysql; flush privileges; $sqlCreateUser $sqlGrant flush privileges;"
mysql -e "use mysql; flush privileges; $sqlCreateUser $sqlGrant flush privileges;"

echo "成功添加远程用户：$username"

echo
echo "重启mariadb"
systemctl stop mariadb
systemctl start mariadb
echo "重启完成"
echo

echo ”允许开机自启“
systemctl enable mariadb

echo "结束安装"
echo "请将 /etc/mysql/mariadb.conf.d/50-server.cnf 文件中ip地址改为 0.0.0.0 并重启才可进行远程访问"
