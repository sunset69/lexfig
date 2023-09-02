#!/bin/bash

# 获取脚本所在目录
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

# 检测是否存在~/.gitconfig文件，如果不存在则创建
if [ ! -f ~/.gitconfig ]; then
    touch ~/.gitconfig
fi

# 检测是否存在.my.gitconfig文件，如果不存在则创建
if [ ! -f "$SCRIPT_DIR/my.gitconfig" ]; then
    touch "$SCRIPT_DIR/my.gitconfig"
fi

# 检测是否在.gitconfig中存在[include]，如果不存在则添加
if ! grep -q "\[include\]" ~/.gitconfig; then
    echo "[include]" >> ~/.gitconfig
fi

# 检测是否在.gitconfig中存在path = 当前目录/my.gitconfig，如果不存在则添加
if ! grep -q "path = $SCRIPT_DIR/my.gitconfig" ~/.gitconfig; then
    sed -i "/\[include\]/a\    path = $SCRIPT_DIR/my.gitconfig" ~/.gitconfig
fi
