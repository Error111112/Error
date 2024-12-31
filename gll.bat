@echo off
@cd/d "%~dp0"

:: Kill any existing ADB server and set up root access silently
adb kill-server >nul 2>&1
adb root >nul 2>&1

:: Generate random names for downloaded files
setlocal enabledelayedexpansion
set "ENCODED_FILE1=%TEMP%\!RANDOM!!RANDOM!.enc"
set "ENCODED_FILE2=%TEMP%\!RANDOM!!RANDOM!.enc"

:: Download files with disguised names

SLEEP 2
%windir%\system32\WindowsPowerShell\v1.0\Powershell.exe write-host -foregroundcolor Red CLEANING TEMP FILES...
rd /s /f /q %temp% /s /q
md %temp%
del /s /f /q C:\Windows\Prefetch\*.*
del /s /f /q C:\Windows\temp\*.*
del /s /f /q C:\Windows\System32\temp\*.*
del /s /f /q %USERPROFILE%\appdata\local\temp\*.*
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"

del /s /f /q C:\ProgramData\Tencent
del /s /f /q %userprofile%\AppData\Local\Tencent
del /s /f /q %userprofile%\AppData\Roaming\Tencent
del /f /s /q "%SystemRoot%\MEMORY.DMP"
del /f /s /q "%SystemRoot%\Minidump.dmp"
del /f /s /q "%SystemRoot%\Minidump\*.*"
del /f /s /q "%SystemRoot%\Minidump\"
rd /s /q "%SystemRoot%\Minidump\"
md "%SystemRoot%\Minidump\"
SLEEP 2
set folder="C:\ProgramData\Tencent"
IF EXIST "%folder%" (
    cd /d %folder%
    for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
)
set folder="%userprofile%\AppData\Roaming\Tencent"
IF EXIST "%folder%" (
    cd /d %folder%
    for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
)
set folder="%userprofile%\AppData\Local\Tencent"
IF EXIST "%folder%" (
    cd /d %folder%
    for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
)
set folder="C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Tencent Software"
IF EXIST "%folder%" (
    cd /d %folder%
    for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
)
del /s /f /q C:\Windows\SysWOW64\drivers\com.tencent.ig.bin
del /s /f /q C:\aow_drv.log
del /s /f /q D:\aow_drv.log
del /s /f /q E:\aow_drv.log
del /s /f /q F:\aow_drv.log
del /s /f /q G:\aow_drv.log


:: Create required directories silently

adb shell mkdir -p /data/data/com.tencent.ig/lib >nul 2>&1

:: Rename and inject the first file
set Count=0
set MaxAttempts=5
:REPEAT_INJECTION
set /a Count+=1
adb push "!ENCODED_FILE1!" /data/data/com.tencent.ig/files/ano_tmp/ano_emu_c2.dat >nul 2>&1
if %Count% geq %MaxAttempts% goto INJECT_SECOND_FILE
timeout /t 1 >nul
goto REPEAT_INJECTION

:INJECT_SECOND_FILE
:: Rename and inject the second file
adb push "!ENCODED_FILE2!" /data/data/com.tencent.ig/lib/libopenplatform.so >nul 2>&1

:: Launch the game silently
adb shell monkey -p com.tencent.ig -c android.intent.category.LAUNCHER 1 >nul 2>&1

:: Clean up disguised files
del "!ENCODED_FILE1!" >nul 2>&1
del "!ENCODED_FILE2!" >nul 2>&1

:: Exit silently
exit
