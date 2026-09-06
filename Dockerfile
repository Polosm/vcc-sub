# 使用 Subconverter 官方最新镜像
FROM tindy2013/subconverter:latest

# 覆盖默认配置文件（后续创建）
COPY pref.toml /base/pref.toml

# 暴露8080端口
EXPOSE 8080

# 启动服务
# CMD ["./subconverter"]
