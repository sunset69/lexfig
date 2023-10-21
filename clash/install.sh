#!/bin/bash

# 检测Clash是否已安装
if ! command -v clash &> /dev/null; then
    echo "Clash未安装，正在使用Snap进行安装..."
    
    # 检测管理员权限
	if [[ $EUID -ne 0 ]]; then
	    echo "该脚本需要以sudo权限运行，请输入密码："
	    sudo "$0" "$@"  # 使用sudo重新运行脚本
	    exit $?  # 退出当前非sudo权限的脚本
	fi
    
    # 使用Snap安装Clash
    snap install clash
    echo "Clash安装完成."
fi

# 创建软连接到~/.config目录
if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

ln -s "$(pwd)" ~/.config

echo "软连接已创建到~/.config目录."
