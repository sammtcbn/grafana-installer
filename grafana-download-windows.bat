@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

set dlver=8.2.3
set dlfile=grafana-%dlver%.windows-amd64.zip
set dlurl=https://dl.grafana.com/oss/release/%dlfile%
set foldername=grafana-%dlver%

curl --fail --output %dlfile% %dlurl%
if %errorlevel% neq 0 (
    echo Fail to download %dlfile%
    pause
    goto End
)

if not exist %dlfile% (
    echo %dlfile% not found
    pause
    goto End
)

powershell -command "Expand-Archive -Force %dlfile% ."

if not exist %foldername%\bin\grafana-server.exe (
    echo Fail to extract %dlfile%
    pause
    goto End
)

rename %foldername% grafana

:END
echo bye
timeout /t 3
