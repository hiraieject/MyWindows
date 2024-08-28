@echo on

:: 管理者権限での実行をチェック
net session >nul 2>&1
if %errorLevel% == 0 (
    echo admin
) else (
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit
)

set YYYY=2024
set MM=07
set DD=27

set INSTALLDRIVE=C:
set INSTALLFOLDER=%INSTALLDRIVE%\msys64
%INSTALLDRIVE%

set SETUPFILE=msys2-x86_64-%YYYY%%MM%%DD%.exe
set URL="https://github.com/msys2/msys2-installer/releases/download/%YYYY%-%MM%-%DD%/%SETUPFILE%"


IF NOT EXIST "%INSTALLFOLDER%" (
    echo %INSTALLFOLDER% does not exist. Creating directory...
    mkdir "%INSTALLFOLDER%"
    echo Directory created.
) ELSE (
    echo %INSTALLFOLDER% already exists.
)

rem Download setup file
IF NOT EXIST "%SETUPFILE%" (
   curl -k -L %URL% -o %SETUPFILE%
)

rem Execute setup
%SETUPFILE% in --confirm-command --accept-messages --root %INSTALLFOLDER%
@echo off

echo.
echo "install finished"
echo.
pause

