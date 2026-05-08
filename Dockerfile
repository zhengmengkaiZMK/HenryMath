FROM nginx:alpine

# 删除默认配置
RUN rm /etc/nginx/conf.d/default.conf

# 复制自定义配置模板
COPY nginx.conf /etc/nginx/templates/default.conf.template

# 复制网页文件
COPY index.html /usr/share/nginx/html/index.html

# Railway 使用 PORT 环境变量
ENV PORT=80
EXPOSE ${PORT}

CMD ["nginx", "-g", "daemon off;"]
