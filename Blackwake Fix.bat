:: Script niceties
@echo off
setlocal EnableDelayedExpansion

:: Check administrator PRIVILEGES
net session >nul 2>&1
if %errorLevel% == 0 ( :: Passed check, set system environnmental variable
    goto gotAdmin
)else ( :: Failed check
    echo This script requires running as an administrator
    echo Press Y to accept, N to decline
    choice /C YN
    if errorlevel 2 (
        exit
    )
    goto UACPrompt
)

:: Creates a temporary VBS script to run this script as an administrator
:UACPrompt

echo set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
exit

:gotAdmin

:: Delete prior vbs script if it was created
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"

:: Actual script for setting the system environmental variable
cls
echo ==============================================================
echo Blackwake Intel Fix
echo ==============================================================
echo
setx OPENSSL_ia32cap "~0x20000000" /m >nul
echo Environment variable set. The script will now exit.
timeout /t 5 >nul
exit
