@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

C:\grafana\bin\nssm stop grafana
C:\grafana\bin\nssm remove grafana confirm

:END
echo bye
timeout /t 3
