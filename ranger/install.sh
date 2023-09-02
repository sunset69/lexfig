#!/bin/bash

if dpkg -s ranger >/dev/null 2>&1; then
    echo "ranger已安装"
else
    echo "ranger未安装，正在安装..."
    sudo apt-get install ranger -y
fi

# 软链接当前路径到指定目录
ln -s "$(pwd)" ~/.config/

echo "已将配置文件映射到~/config/ranger目录"
