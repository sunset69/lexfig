#!/bin/bash

# 软链接当前路径到指定目录
ln -s "$(pwd)" ~/.config/

echo "Neovim配置文件已生成，并将当前路径软链接到~/.config/nvim目录。"
