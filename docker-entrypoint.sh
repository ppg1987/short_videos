#!/bin/sh
set -e

# Render 会把端口写在环境变量 $PORT 里，Apache 默认监听 80，这里替换掉
PORT="${PORT:-80}"

# 替换 Apache 监听端口（ports.conf 里的 Listen 80）
sed -i "s/^Listen 80\$/Listen ${PORT}/" /etc/apache2/ports.conf

# 替换默认站点的 VirtualHost 端口（000-default.conf 里的 <VirtualHost *:80>）
sed -i "s/<VirtualHost \*:80>/<VirtualHost *:${PORT}>/" /etc/apache2/sites-available/000-default.conf

# 以前台方式启动 Apache（保持容器运行）
exec apache2-foreground
