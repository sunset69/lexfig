#!/bin/bash

# 检查my.bashrc是否存在
if [ ! -f "my.bashrc" ]; then
    echo "my.bashrc文件不存在"
    exit 1
fi

# 检查~/.bashrc是否存在
if [ ! -f ~/.bashrc ]; then
    echo "~/.bashrc文件不存在，将创建它"
    touch ~/.bashrc
fi

# 检查~/.bashrc是否已存在相应的行
if grep -q "source $(pwd)/my.bashrc" ~/.bashrc; then
    echo "已存在相应的行，无需添加"
else
    # 添加到~/.bashrc
    echo "source $(pwd)/my.bashrc" >> ~/.bashrc
    echo "已成功添加到~/.bashrc"
    source ~/.bashrc
fi
