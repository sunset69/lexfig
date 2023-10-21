#!/bin/bash

# 检测是否有 sudo 权限，无则提权
if [ $(id -u) -ne 0 ]; then
    echo "请使用 sudo 权限运行该脚本"
    exit 1
fi

# 获取脚本所在路径
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 设置 Clash 相关路径
CLASH_PATH="${SCRIPT_DIR}/clash"
CONFIG_DIR="${SCRIPT_DIR}"

# 生成 Clash 服务文件
SERVICE_FILE="/etc/systemd/system/clash.service"
cat << EOF > $SERVICE_FILE
[Unit]
Description=Clash Service
After=network.target

[Service]
ExecStart=${CLASH_PATH} -d ${CONFIG_DIR}

[Install]
WantedBy=default.target
EOF

# 设置服务文件权限
chmod 644 $SERVICE_FILE

# 重载 systemd 配置
systemctl daemon-reload

# 启用 Clash 服务并设置为开机自启
systemctl enable clash
systemctl start clash
