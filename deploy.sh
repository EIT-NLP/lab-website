#!/bin/bash

# 部署脚本 - 使用相对路径配置生成网站

echo "开始构建网站（使用部署配置）..."

# 清理之前的构建
rm -rf _site

# 使用部署配置构建
bundle exec jekyll build --config _config.yml,_config_deploy.yml

if [ $? -eq 0 ]; then
    echo "✅ 网站构建成功！"
    echo "📁 生成的文件在 _site 目录中"
    echo "🚀 可以直接部署到任何Web服务器"
    
    # 显示一些关键文件
    echo ""
    echo "📋 生成的主要文件："
    ls -la _site/ | head -10
    
    echo ""
    echo "🔍 检查图片路径（应该是相对路径）："
    grep -n "src.*images" _site/index.html | head -3
    
else
    echo "❌ 构建失败，请检查错误信息"
    exit 1
fi
