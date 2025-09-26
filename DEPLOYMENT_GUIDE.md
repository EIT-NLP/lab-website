# Vue SPA 部署到 IIS 指南

## 🚀 部署步骤

### 1. 构建项目
```bash
npm run build
```

### 2. 部署文件
将 `dist/` 目录下的所有文件复制到IIS网站根目录。

### 3. IIS配置

#### 选项A：使用web.config（推荐）
- 确保 `web.config` 文件在网站根目录
- 安装 [IIS URL重写模块](https://www.iis.net/downloads/microsoft/url-rewrite)

#### 选项B：手动配置IIS
如果web.config不工作，在IIS管理器中手动配置：

1. 打开IIS管理器
2. 选择您的网站
3. 双击"URL重写"
4. 添加规则：
   - **名称**：Vue Router
   - **模式**：`.*`
   - **条件**：
     - `{REQUEST_FILENAME}` 不是文件
     - `{REQUEST_FILENAME}` 不是目录
   - **操作**：重写到 `/sys/index.html`

#### 选项C：删除web.config
如果仍然出现500错误：
1. 删除 `web.config` 文件
2. 使用选项B手动配置IIS

## 🔧 故障排除

### 500错误解决方案

1. **检查IIS URL重写模块**
   - 下载安装：https://www.iis.net/downloads/microsoft/url-rewrite
   - 重启IIS服务

2. **检查应用程序池**
   - 确保应用程序池支持.NET Framework
   - 设置为"集成"模式

3. **检查权限**
   - 确保IIS_IUSRS有读取权限
   - 检查网站目录权限

4. **简化配置**
   - 如果复杂配置不工作，使用最简单的重写规则
   - 逐步添加功能

### 测试步骤

1. 先测试主页：`https://your-domain/sys/`
2. 再测试子页面：`https://your-domain/sys/research`
3. 检查浏览器开发者工具的网络面板

## 📁 文件结构

部署后的目录结构：
```
网站根目录/
├── index.html          # 主页面
├── web.config          # IIS配置（可选）
├── .htaccess          # Apache配置（备用）
├── assets/            # 静态资源
│   ├── *.css
│   ├── *.js
│   └── *.png
└── src/
    └── assets/
        └── images/
            └── papers/  # 论文图片
```

## ✅ 验证清单

- [ ] 主页可以访问
- [ ] 直接访问子页面可以工作
- [ ] 图片正常显示
- [ ] 路由跳转正常
- [ ] 没有控制台错误
