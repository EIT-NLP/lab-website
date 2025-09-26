@echo off
REM Vue项目部署脚本 (Windows版本)

echo 开始构建Vue项目...

REM 清理之前的构建
if exist "dist" (
    echo 清理之前的构建文件...
    rmdir /s /q dist
)

REM 安装依赖（如果需要）
if not exist "node_modules" (
    echo 安装依赖...
    npm install
)

REM 构建项目
echo 构建生产版本...
npm run build:prod

REM 检查构建是否成功
if %errorlevel% equ 0 (
    echo ✅ 构建成功！
    echo 📁 构建文件位于: dist/
    echo 🌐 可以通过以下命令预览:
    echo    npm run serve
    echo.
    echo 📋 构建文件结构:
    dir dist
) else (
    echo ❌ 构建失败！
    exit /b 1
)

echo.
echo 🚀 部署说明:
echo 1. 将 dist/ 目录下的所有文件上传到服务器
echo 2. 确保服务器配置支持 /sys/ 路径
echo 3. 配置服务器重写规则以支持Vue Router的history模式

pause
