#!/bin/bash

# 定义软件列表文件路径
software_file="software_list.txt"

# 检查软件是否已安装
function check_installed {
    if [ -x "$(command -v $1)" ]; then
        #echo "$1 已安装"
        return 0
    else
        echo "$1 未安装"
        return 1
    fi
}

# 安装软件
function install_software {
    if check_installed $1; then
        echo "已安装，跳过安装 $1"
    else
        echo "=============== 正在安装 $1 ...===============>"
        apt-get install $1 -y
        # 如果安装成功，则输出安装成功的提示信息
        if [ $? -eq 0 ]; then
            echo "=============== $1 安装成功 ===============>"
        else
            echo "$1 安装失败"
        fi
    fi
}

# 从文件加载软件列表并处理注释行
if [ -f "$software_file" ]; then
    software_list=($(grep -v '^\s*#' "$software_file"))
else
    echo "软件列表文件 $software_file 不存在"
    exit 1
fi

# 检查是否已经具有sudo权限
if [[ $EUID -ne 0 ]]; then
    echo "该脚本需要以sudo权限运行，请输入密码："
    sudo "$0" "$@"  # 使用sudo重新运行脚本
    exit $?  # 退出当前非sudo权限的脚本
fi

# 在这里添加你的脚本代码，已经具有sudo权限

echo "更新中..."
apt-get update

# 遍历软件列表并安装
for software in ${software_list[@]}; do
    install_software $software
done
echo "全部安装完毕！"
