@echo off
chcp 65001 >nul
REM Windows batch file version - for running Docker containers on Windows

REM Set variables
set IMAGE=lab-website-renderer:latest
set CONTAINER=lab-website-renderer
set PLATFORM=

REM Get current working directory
set WORKING_DIR=%CD%

echo Building Docker image...
docker build %PLATFORM% --tag %IMAGE% --file ./.docker/Dockerfile .

if %ERRORLEVEL% neq 0 (
    echo Build failed!
    pause
    exit /b 1
)

echo Running Docker container...
docker run %PLATFORM% ^
    --name %CONTAINER% ^
    --init ^
    --rm ^
    --interactive ^
    --tty ^
    --publish 4000:4000 ^
    --publish 35729:35729 ^
    --volume "%WORKING_DIR%:/usr/src/app" ^
    %IMAGE% %*

if %ERRORLEVEL% neq 0 (
    echo Container run failed!
    pause
    exit /b 1
)
