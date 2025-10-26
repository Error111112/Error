@echo off
echo تنظيف ملفات GameLoop...
del /s /q "C:\ProgramData\Tencent\MobileGamePC\Cache\*.*"
del /s /q "C:\ProgramData\Tencent\MobileGamePC\Temp\*.*"
del /s /q "%temp%\*.*"
echo تم التنظيف بنجاح ✅
