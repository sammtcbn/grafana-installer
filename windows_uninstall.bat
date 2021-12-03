@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

set installpath=C:\grafana

del /f /q C:\Users\%UserName%\Desktop\grafana.html

call firewall_delete_grafana.bat
call windows_service_delete.bat

cd C:\

rmdir /s /q %installpath%
if %errorlevel% neq 0 (
    echo Fail to uninstall
    pause
    goto End
)

:END
echo bye
timeout /t 3
