@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

set installpath=C:\grafana

call grafana-download-windows.bat
call nssm-download.bat

robocopy grafana %installpath% /E

copy /Y "%currdir%\windows_service_create.bat" %installpath%
copy /Y "%currdir%\windows_service_delete.bat" %installpath%
copy /Y "%currdir%\windows_uninstall.bat" %installpath%
copy /Y "%currdir%\firewall_allow_grafana.bat" %installpath%
copy /Y "%currdir%\firewall_delete_grafana.bat" %installpath%
copy /Y "%currdir%\nssm.exe" %installpath%\bin

call windows_service_create.bat
call firewall_allow_grafana.bat

copy /Y "%currdir%\grafana.html" C:\Users\%UserName%\Desktop

:END
echo bye
timeout /t 3
