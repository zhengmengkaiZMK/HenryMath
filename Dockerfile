FROM nginx:alpine

# 复制网页文件
COPY index.html /usr/share/nginx/html/index.html

# 复制自定义 Nginx 配置
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Railway 使用 PORT 环境变量
ENV PORT=80

# 启动时用 sed 替换端口，然后启动 nginx
CMD sed -i "s/listen 80;/listen $PORT;/g" /etc/nginx/conf.d/default.conf && \
    sed -i "s/listen \[::\]:80;/listen [::]:$PORT;/g" /etc/nginx/conf.d/default.conf && \
    nginx -g "daemon off;"
