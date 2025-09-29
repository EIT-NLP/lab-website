# 部署配置说明

## GitHub Secrets 配置

在GitHub仓库的Settings > Secrets and variables > Actions中添加以下secrets：

### Docker Hub配置
- `DOCKER_USERNAME`: Docker Hub用户名
- `DOCKER_PASSWORD`: Docker Hub密码或访问令牌

### 服务器配置
- `HOST`: 服务器IP地址或域名
- `USERNAME`: 服务器用户名
- `SSH_KEY`: 服务器SSH私钥
- `PORT`: SSH端口（默认22）

## 本地部署

### 1. 使用部署脚本
```bash
chmod +x deploy.sh
./deploy.sh
```

### 2. 手动部署
```bash
# 构建镜像
docker build -t lab-website:latest .

# 运行容器
docker run -d \
    --name lab-website \
    --restart unless-stopped \
    -p 10086:80 \
    lab-website:latest
```

## 访问地址

- 本地访问: http://localhost:10086
- 服务器访问: http://your-server-ip:10086

## 健康检查

访问 http://localhost:10086/health 检查服务状态

## 日志查看

```bash
# 查看容器日志
docker logs lab-website

# 实时查看日志
docker logs -f lab-website
```

## 停止服务

```bash
docker stop lab-website
docker rm lab-website
```

## 更新部署

```bash
# 拉取最新代码
git pull

# 重新部署
./deploy.sh
```
