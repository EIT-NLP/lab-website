#!/bin/bash

# 部署脚本
set -e

echo "🚀 开始部署 Lab Website..."

# 检查Docker是否运行
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker未运行，请先启动Docker"
    exit 1
fi

# 构建镜像
echo "📦 构建Docker镜像..."
docker build -t lab-website:latest .

# 停止并删除旧容器
echo "🛑 停止旧容器..."
docker stop lab-website 2>/dev/null || true
docker rm lab-website 2>/dev/null || true

# 运行新容器
echo "🏃 启动新容器..."
docker run -d \
    --name lab-website \
    --restart unless-stopped \
    -p 10086:80 \
    lab-website:latest

# 检查容器状态
echo "✅ 检查部署状态..."
sleep 3
if docker ps | grep -q lab-website; then
    echo "🎉 部署成功！"
    echo "🌐 访问地址: http://localhost:10086"
    echo "📊 容器状态:"
    docker ps | grep lab-website
else
    echo "❌ 部署失败，请检查日志:"
    docker logs lab-website
    exit 1
fi

# 清理未使用的镜像
echo "🧹 清理未使用的镜像..."
docker image prune -f

echo "✨ 部署完成！"