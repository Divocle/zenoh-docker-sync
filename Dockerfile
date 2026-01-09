# 1. 使用包含完整后端库的官方镜像作为基础
FROM zenoh/zenoh:latest

# 2. 将你本地调优好的配置文件拷贝进镜像
# 这样你组网时只需运行镜像，无需额外挂载文件
COPY zenoh.json5 /etc/zenoh.json5

# 3. 暴露组网所需的端口
# 7447 用于 Zenoh 协议通信，8000 用于 REST API
EXPOSE 7447/tcp 7447/udp 8000/tcp

# 4. 设置启动命令，默认加载配置文件
ENTRYPOINT ["/zenohd"]
CMD ["--config", "/etc/zenoh.json5"]