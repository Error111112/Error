@echo off
setlocal

:: ============================
:: CHECK FOR ADMIN PRIVILEGES
:: ============================
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo ===================================================
    echo.
    echo               ** IMPORTANT NOTICE **
    echo     This script requires administrative privileges.
    echo        Please run as administrator to proceed.
    echo.
    echo ===================================================
    pause
    exit /b
)

:: --- INSTALLING VISUAL C++ REDISTRIBUTABLES + DIRECTX ---

:: Tạo thư mục cố định cho tất cả file
set "setup_dir=C:\Windows\vcredist"
mkdir "%setup_dir%" >nul 2>&1

:: Đường dẫn file trong thư mục cố định
set vcredist_x86=%setup_dir%\vc_redist.x86.exe
set vcredist_x64=%setup_dir%\vc_redist.x64.exe
set dx_installer=%setup_dir%\directx_installer.exe
set dx_temp=%setup_dir%\directx

:: ====== VISUAL C++ REDISTRIBUTABLES ======
if not exist "%vcredist_x86%" (
    echo Downloading vc_redist.x86.exe...
    powershell -command "(New-Object Net.WebClient).DownloadFile('https://aka.ms/vs/17/release/vc_redist.x86.exe', '%vcredist_x86%')"
) else (
    echo vc_redist.x86.exe already exists, skipping download...
)

if not exist "%vcredist_x64%" (
    echo Downloading vc_redist.x64.exe...
    powershell -command "(New-Object Net.WebClient).DownloadFile('https://aka.ms/vs/17/release/vc_redist.x64.exe', '%vcredist_x64%')"
) else (
    echo vc_redist.x64.exe already exists, skipping download...
)

:: Cài đặt Visual C++ nếu chưa cài
echo Installing Visual C++...
start /wait "" "%vcredist_x86%" /install /passive /norestart
start /wait "" "%vcredist_x64%" /install /passive /norestart
echo Visual C++ installation completed.

:: ====== DIRECTX ======
if not exist "%dx_installer%" (
    echo Downloading DirectX installer...
    powershell -command "(New-Object Net.WebClient).DownloadFile('https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe', '%dx_installer%')"
) else (
    echo directx_installer.exe already exists, skipping download...
)

:: Giải nén DirectX nếu chưa có
if not exist "%dx_temp%\DXSETUP.exe" (
    echo Extracting DirectX...
    "%dx_installer%" /Q /T:"%dx_temp%"
) else (
    echo DirectX already extracted, skipping...
)

:: Cài đặt DirectX nếu chưa cài
if exist "%dx_temp%\DXSETUP.exe" (
    echo Starting DirectX installation...
    "%dx_temp%\DXSETUP.exe" /silent
    echo DirectX installation completed.
) else (
    echo ERROR: DXSETUP.exe not found, installation skipped.
)

echo.
echo ============================
echo All installations finished!
echo ============================

pause
exit
