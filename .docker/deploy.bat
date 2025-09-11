@echo off
chcp 65001 >nul
REM Offline deployment script for lab-website on Windows server

setlocal enabledelayedexpansion

REM Set variables
set IMAGE_NAME=lab-website-renderer:latest
set CONTAINER_NAME=lab-website-renderer
set EXPORT_FILE=lab-website-renderer.tar
set PLATFORM=

REM Get current working directory and navigate to project root
set WORKING_DIR=%CD%
REM If running from .docker directory, go up one level to project root
if "%CD:~-7%"=="\.docker" (
    cd ..
    set WORKING_DIR=%CD%
    echo Detected running from .docker directory, switching to project root: %WORKING_DIR%
)

echo ========================================
echo    Lab Website Offline Deployment
echo ========================================
echo.

REM Check if Docker is installed
echo Checking Docker environment...
docker --version >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo Error: Docker is not installed or not running!
    echo Please ensure Docker Desktop is installed and running.
    pause
    exit /b 1
)
echo Docker environment check passed
echo.

REM Check if image file exists
echo Checking image file...
if not exist "%EXPORT_FILE%" (
    echo Error: Image file %EXPORT_FILE% not found
    echo Please ensure the image file is in the current directory.
    pause
    exit /b 1
)
echo Image file check passed
echo.

REM Check if entrypoint.sh exists
echo Checking entrypoint script...
if not exist ".docker\entrypoint.sh" (
    echo Error: .docker\entrypoint.sh file not found
    echo Current directory: %CD%
    echo Please ensure you are in the project root directory.
    echo Expected file location: .docker\entrypoint.sh
    pause
    exit /b 1
)
echo Entrypoint script check passed
echo.

REM Check if project files exist
echo Checking project files...
if not exist "_cite\cite.py" (
    echo Error: _cite\cite.py file not found
    echo Please ensure you are in the project root directory.
    pause
    exit /b 1
)
if not exist "Gemfile" (
    echo Error: Gemfile not found
    echo Please ensure you are in the project root directory.
    pause
    exit /b 1
)
echo Project files check passed
echo.

REM Stop and remove existing containers
echo Cleaning existing containers...
docker stop %CONTAINER_NAME% >nul 2>&1
docker rm %CONTAINER_NAME% >nul 2>&1
echo Container cleanup completed
echo.

REM Remove existing images
echo Cleaning existing images...
docker rmi %IMAGE_NAME% >nul 2>&1
echo Image cleanup completed
echo.

REM Load image
echo Loading Docker image...
docker load -i %EXPORT_FILE%

if %ERRORLEVEL% neq 0 (
    echo Error: Image loading failed!
    pause
    exit /b 1
)
echo Image loaded successfully
echo.

REM Run container in background
echo Starting container in background...
echo Logs will be written to app.log
echo.

REM Start container in background and redirect output to log file
start /B docker run %PLATFORM% ^
    --name %CONTAINER_NAME% ^
    --init ^
    --rm ^
    --publish 368:4000 ^
    --publish 35729:35729 ^
    --volume "%WORKING_DIR%:/usr/src/app" ^
    %IMAGE_NAME% > app.log 2>&1

REM Wait a moment for container to start
timeout /t 3 /nobreak >nul

REM Check if container is running
docker ps --filter "name=%CONTAINER_NAME%" --format "table {{.Names}}\t{{.Status}}" | findstr %CONTAINER_NAME% >nul
if %ERRORLEVEL% neq 0 (
    echo Error: Container failed to start!
    echo Check app.log for detailed error information.
    echo.
    echo Possible solutions:
    echo 1. Check if ports 368 and 35729 are occupied
    echo 2. Ensure Docker Desktop is running
    echo 3. Check if disk space is sufficient
    echo 4. Try running this script as administrator
    echo 5. Check app.log for detailed error messages
    pause
    exit /b 1
)

echo.
echo ========================================
echo    Deployment Completed!
echo ========================================
echo Website is now running in background, accessible at:
echo - Main site: http://localhost:368
echo - Live reload: http://localhost:35729
echo.
echo Container name: %CONTAINER_NAME%
echo Log file: app.log
echo.
echo To stop the service, run:
echo docker stop %CONTAINER_NAME%
echo.
echo To view logs in real-time:
echo Get-Content app.log -Wait
echo ========================================
