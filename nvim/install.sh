#!/bin/bash

app=neovim

if dpkg -s $app >/dev/null 2>&1; then
    echo "$app 已安装"
else
    echo "$app 未安装，正在安装..."
    apt-get install $app
fi

# 软链接当前路径到指定目录
ln -s "$(pwd)" ~/.config/

echo "Neovim配置文件已生成，并将当前路径软链接到~/.config/nvim目录。"
