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

set INSTALLDRIVE=C:
set INSTALLFOLDER=%INSTALLDRIVE%\cygwin64
%INSTALLDRIVE%

set SETUPFILE=setup-x86_64.exe
set URL=https://www.cygwin.com/setup-x86_64.exe

if not exist "%SETUPFILE%" (
    echo %SETUPFILE% not found, downloading...
    curl -k -O %URL%
)

%SETUPFILE% --root %INSTALLFOLDER% --local-package-dir %INSTALLFOLDER% --site http://ftp.iij.ad.jp/pub/cygwin/ --quiet-mode --packages gcc-core,gcc-g++,git,make,cmake,patch,python3,python3-pip,libexpat1,python3-devel,libncurses-devel,libboost-devel,libsqlite3-devel,libxml2-devel,libxslt-devel,wget,emacs-gtk,emacs-anthy,xterm,gdb
rem openssl-devel,python3-tk,python3-venv,readline-devel


rem install sygserver as service
set BASH=%INSTALLFOLDER%\bin\bash.exe
%BASH% --login -c "/usr/bin/cygserver-config -y"

rem start sygserver service
net start "CYGWIN cygserver"

pause

