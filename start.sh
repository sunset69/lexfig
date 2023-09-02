#!/bin/bash

# 定义功能选项数组
options=("退出" "安装软件" "配置neovim" "配置ranger" "bash")

# 显示功能选项
function show_options() {
    echo "请选择一个功能："
    for ((i=0; i<${#options[@]}; i++)); do
        echo "$((i)). ${options[$i]}"
    done
}

# 处理用户输入
function handle_input() {
    read -p "请输入选项的编号: " choice
    case $choice in
        0)
            # 退出
            exit 0
            ;;
        1)
            # 安装软件
            cd software
            bash $(pwd)/install.sh
            cd ..
            ;;
        2)
            # neovim配置
            cd nvim
            bash $(pwd)/install.sh
            cd ..
            ;;
        3)
            # ranger配置
            cd ranger
            bash $(pwd)/install.sh
            cd ..
            ;;
        4)
            # ranger配置
            cd bash
            bash $(pwd)/install.sh
            cd ..
            ;;
        *)
            # 处理无效的选项
            echo "无效的选项，请重新选择"
            ;;
    esac
}

# 主循环
while true; do
    show_options
    handle_input
    echo
done
