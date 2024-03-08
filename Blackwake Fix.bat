@echo off
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Running as administrator
    setx OPENSSL_ia32cap "~0x20000000" /M
    echo Environment variable set. The script will now exit.
) else (
    echo Not running as administrator. Please run the script as an administrator.
)
pause
exit