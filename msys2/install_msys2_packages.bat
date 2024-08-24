@echo off

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
set INSTALLFOLDER=%INSTALLDRIVE%\msys64
%INSTALLDRIVE%
cd %INSTALLFOLDER%

REM pacmanのリポジトリを最新に更新
%INSTALLFOLDER%\usr\bin\bash -lc "pacman -Sy --noconfirm"

%INSTALLFOLDER%\usr\bin\bash -lc "pacman -S --needed --noconfirm vim"
%INSTALLFOLDER%\usr\bin\bash -lc "pacman -S --needed --noconfirm git"
%INSTALLFOLDER%\usr\bin\bash -lc "pacman -S --needed --noconfirm cmake"
%INSTALLFOLDER%\usr\bin\bash -lc "pacman -S --needed --noconfirm base-devel"
%INSTALLFOLDER%\usr\bin\bash -lc "pacman -S --needed --noconfirm mingw-w64-x86_64-toolchain"
%INSTALLFOLDER%\usr\bin\bash -lc "pacman -S --needed --noconfirm mingw-w64-x86_64-emacs"

echo.
echo "install finished"
echo.
pause


rem memo

rem キーワードでパッケージを探す：
rem pacman -Ss xxxxx

rem パッケージ一覧
rem pacman -Sl
rem pacman -Sl | grep mingw64
