@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

C:\grafana\nssm stop grafana
C:\grafana\nssm remove grafana confirm

:END
echo bye
timeout /t 3
