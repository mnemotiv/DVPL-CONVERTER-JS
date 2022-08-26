@echo off
:begin
echo Select a task:
echo =============  RXD DVPL CONVERTER NODE.JS EDITION V4.0 =============
echo - Author: RifsxD
echo - Code: JavaScript
echo - Version: 4.0
echo -
echo 1) Decompress
echo 2) Compress
echo 3) Help
echo 4) Contact
echo 5) Exit
echo -
set url="https://rxd-mods.xyz/#contact"
set /p op=Type option:
if "%op%"=="1" goto op1
if "%op%"=="2" goto op2
if "%op%"=="3" goto op3
if "%op%"=="4" goto op4
if "%op%"=="5" goto op5

echo Please Pick an option:
goto begin


:op1
dvpl-win.exe dcp
echo you picked decompress
goto begin

:op2
dvpl-win.exe cp
echo you picked compress
goto begin

:op3
dvpl-win.exe -h
echo you picked help
goto begin

:op4
start microsoft-edge:%url%
echo you picked support
goto begin

:op5
exit
echo you picked exit
goto begin

:exit
@exit