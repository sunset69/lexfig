#!/bin/bash

sudo apt-get install ranger -y
# 软链接当前路径到指定目录
ln -s "$(pwd)" ~/.config/

echo "已将配置文件映射到~/config/ranger目录"
