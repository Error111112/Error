@echo off
echo Cleaning system temp folders...

:: Delete user temp files
del /f /s /q "%TEMP%\*"
for /d %%i in ("%TEMP%\*") do rd /s /q "%%i"

:: Delete Windows temp files
del /f /s /q "C:\Windows\Temp\*"
for /d %%i in ("C:\Windows\Temp\*") do rd /s /q "%%i"

:: Clear DNS cache (safe)
ipconfig /flushdns

echo Running Disk Cleanup...


echo Cleanup complete.
