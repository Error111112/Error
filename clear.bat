@echo off
echo ===============================
echo تنظيف ملفات ببجي بأقصى قوة...
echo ===============================

:: مسح ملفات MMKV و ShadowTrackerExtra
adb shell rm -rf /sdcard/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/MMKV
adb shell rm -rf /sdcard/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Logs/*

:: مسح Cache و Temp
adb shell rm -rf /sdcard/Android/data/com.tencent.ig/cache/*
adb shell rm -rf /sdcard/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Temp/*

echo.
echo تم تنظيف الملفات المؤقتة بنجاح ✅
echo يمكنك الآن تشغيل اللعبة بأداء أفضل
pause