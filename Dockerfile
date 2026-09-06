# 使用 Subconverter 官方最新镜像
FROM tindy2013/subconverter:latest

# 覆盖默认配置文件（后续创建）
COPY pref.toml /base/pref.toml

# 暴露 25500 端口
EXPOSE 25500

# 启动服务
CMD ["./subconverter"]
