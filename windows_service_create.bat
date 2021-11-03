@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

C:\grafana\nssm install grafana "grafana-server.exe"
C:\grafana\nssm set grafana AppDirectory "C:\grafana\bin"
C:\grafana\nssm start grafana

:END
echo bye
timeout /t 3
