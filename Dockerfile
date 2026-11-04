基于官方 PHP 8.2 + Apache 镜像
已内置 curl / json 扩展，Apache 多进程并发，
因此 api/sv.php 的"聚合自请求"不会卡死，抖音/快手/小红书/B站等全平台可用。
FROM php:8.2-apache

把 short_videos 整个项目放到 Apache 默认站点根目录
COPY . /var/www/html/

入口脚本：让 Apache 监听 Render 注入的 $PORT
（Render 在容器外做 HTTPS 终止，容器内走明文 HTTP）
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 80
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
