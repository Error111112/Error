@echo off
title Windows Deep Cleaner
color 0a

echo ======================================
echo      تنظيف الجهاز بالكامل جاري...
echo ======================================
echo.

:: تنظيف الملفات المؤقتة
echo - حذف ملفات TEMP...
del /q /f /s "%temp%\*.*" 2>nul
del /q /f /s "C:\Windows\Temp\*.*" 2>nul

:: تنظيف prefetch
echo - تنظيف Prefetch...
del /q /f /s "C:\Windows\Prefetch\*.*" 2>nul

:: تنظيف DNS
echo - تنظيف DNS...
ipconfig /flushdns

:: تنظيف سجل Windows Update
echo - تنظيف مخلفات تحديثات Windows...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
del /q /f /s "C:\Windows\SoftwareDistribution\Download\*.*" 2>nul
net start wuauserv >nul 2>&1
net start bits >nul 2>&1

:: تنظيف Recycle Bin
echo - تفريغ سلة المهملات...
rd /s /q C:\$Recycle.Bin

:: تنظيف ملفات التقارير
echo - تنظيف تقارير الأخطاء...
del /q /f /s "C:\ProgramData\Microsoft\Windows\WER\*.*" 2>nul

:: تشغيل فحص SFC (اختياري)
echo - فحص ملفات النظام...
sfc /scannow

echo.
echo ======================================
echo   تم التنظيف بنجاح! أعد تشغيل الجهاز.
echo ======================================

