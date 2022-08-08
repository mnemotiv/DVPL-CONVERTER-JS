@ECHO OFF
CLS
ECHO 1.Decompress
ECHO 2.Compress
ECHO 3.Help
ECHO.

CHOICE /C 123 /M "Enter your choice:"

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 3 GOTO Help
IF ERRORLEVEL 2 GOTO Compress
IF ERRORLEVEL 1 GOTO Decompress

:Decompress
ECHO Decompress (./dvpl-win.exe d)
GOTO End

:Compress
ECHO Compress (./dvpl-win.exe c)
GOTO End

:Help
ECHO Help (./dvpl-win.exe -h)
GOTO End

:End