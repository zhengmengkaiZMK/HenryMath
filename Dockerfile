FROM nginx:alpine

# 删除默认配置
RUN rm /etc/nginx/conf.d/default.conf

# 复制网页文件
COPY index.html /usr/share/nginx/html/index.html

# 复制自定义 Nginx 配置（使用占位符）
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 暴露端口（Railway 会自动设置 PORT 环境变量）
EXPOSE 80

# 启动时替换端口占位符，然后启动 nginx
CMD sh -c "sed -i 's/__PORT__/'\"$PORT\"'/' /etc/nginx/conf.d/default.conf && echo 'Nginx listening on port:' $PORT && cat /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"
