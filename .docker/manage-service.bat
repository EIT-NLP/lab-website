@echo off
chcp 65001 >nul
REM Service management script for lab-website

setlocal enabledelayedexpansion

set CONTAINER_NAME=lab-website-renderer
set LOG_FILE=app.log

echo ========================================
echo    Lab Website Service Manager
echo ========================================
echo.

:menu
echo Please select an option:
echo 1. Start service (background)
echo 2. Stop service
echo 3. Restart service
echo 4. View logs (real-time)
echo 5. View logs (last 50 lines)
echo 6. Check service status
echo 7. Exit
echo.
set /p choice="Enter your choice (1-7): "

if "%choice%"=="1" goto start_service
if "%choice%"=="2" goto stop_service
if "%choice%"=="3" goto restart_service
if "%choice%"=="4" goto view_logs_realtime
if "%choice%"=="5" goto view_logs_tail
if "%choice%"=="6" goto check_status
if "%choice%"=="7" goto exit
echo Invalid choice. Please try again.
echo.
goto menu

:start_service
echo Starting service...
call .docker\deploy.bat
echo.
goto menu

:stop_service
echo Stopping service...
docker stop %CONTAINER_NAME% >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo Service stopped successfully.
) else (
    echo Service was not running or already stopped.
)
echo.
goto menu

:restart_service
echo Restarting service...
docker stop %CONTAINER_NAME% >nul 2>&1
timeout /t 2 /nobreak >nul
call .docker\deploy.bat
echo.
goto menu

:view_logs_realtime
echo Viewing logs in real-time (Press Ctrl+C to stop)...
if exist "%LOG_FILE%" (
    powershell -Command "Get-Content '%LOG_FILE%' -Wait"
) else (
    echo Log file not found: %LOG_FILE%
)
echo.
goto menu

:view_logs_tail
echo Last 50 lines of logs:
if exist "%LOG_FILE%" (
    powershell -Command "Get-Content '%LOG_FILE%' | Select-Object -Last 50"
) else (
    echo Log file not found: %LOG_FILE%
)
echo.
goto menu

:check_status
echo Checking service status...
docker ps --filter "name=%CONTAINER_NAME%" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
echo.
if exist "%LOG_FILE%" (
    echo Log file size: 
    dir "%LOG_FILE%" | findstr "%LOG_FILE%"
) else (
    echo Log file not found: %LOG_FILE%
)
echo.
goto menu

:exit
echo Goodbye!
exit /b 0
