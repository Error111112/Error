@echo off
adb kill-server
adb root

REM توليد قيمة عشوائية لاستخدامها في الأوامر
set tool=34
Setlocal EnableDelayedExpansion
Set RNDtool=%tool%
Set Alphanumer=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789
Set Noradin=%Alphanumer%987654321

:GenerateRandom
IF NOT "%Noradin:~18%"=="" SET Noradin=%Noradin:~9%& SET /A NII+=9& GOTO :GenerateRandom
SET UC=%Noradin:~9,1%
SET /A NII=NII+UC
Set Count=0
SET RndAlphaNum=

:RandomLoop
Set /a Count+=1
SET RND=%Random%
Set /A RND=RND%%%NII%
SET RndAlphaNum=!RndAlphaNum!!Alphanumer:~%RND%,1!
If !Count! lss %RNDtool% goto RandomLoop

REM تنفيذ الأوامر لتغيير إعدادات النظام
adb shell setprop ro.product.device %RndAlphaNum%6b1a77f674510efbe5216b1b1b41%RndAlphaNum%
adb shell content insert --uri content://settings/secure --bind name:s:android_id --bind value:s:%RndAlphaNum%6b1a77f674510efbe5216b1b1b41%RndAlphaNum%
adb shell settings put secure android_id %RndAlphaNum%6b1a77f674510efbe5216b1b1b41%RndAlphaNum%
adb shell rm -rf /sdcard/Android/.system_android_l2
adb shell setprop ro.product.brand %RndAlphaNum%6b1a77f674510efbe5216b1b1b41%RndAlphaNum%
adb shell setprop ro.product.model %RndAlphaNum%6b1a77f674510efbe5216b1b1b41%RndAlphaNum%
adb shell setprop ro.product.name %RndAlphaNum%6b1a77f674510efbe5216b1b1b41%RndAlphaNum%
adb shell setprop ro.product.manufacturer %RndAlphaNum%6b1a77f674510efbe5216b1b1b41%RndAlphaNum%
adb shell setprop ro.android_id %RndAlphaNum%6b1a77f674510efbe5216b1b1b41%RndAlphaNum%
adb shell setprop net.hostname %RndAlphaNum%6b1a77f674510efbe5216b1b1b41%RndAlphaNum%
adb shell setprop gaid %RndAlphaNum%6b1a77f674510efbe5216b1b1b41%RndAlphaNum%
adb shell setprop android.device.id %RndAlphaNum%6b1a77f674510efbe5216b1b1b41%RndAlphaNum%
adb shell setprop ro.serialno %RndAlphaNum%6b1a77f674510efbe5216b1b1b41%RndAlphaNum%
adb shell setprop ro.runtime.firstboot %RndAlphaNum%6b1a77f674510efbe5216b1b1b41%RndAlphaNum%
adb shell setprop ro.mac_address %RndAlphaNum%6b1a77f674510efbe5216b1b1b41%RndAlphaNum%

REM تنظيف الملفات المؤقتة والتخزين
adb shell rm -rf /data/data/com.tencent.ig/cache/*
adb shell rm -rf /data/data/com.tencent.ig/code_cache/*
adb shell rm -rf /data/data/com.tencent.ig/shared_prefs/*
adb shell rm -rf /data/data/com.tencent.ig/databases/*
adb shell rm -rf /data/data/com.tencent.ig/files/.system_android_l2
adb shell chmod 000 /proc/{{cpuinfo,meminfo}} /system/build.prop /sys/devices/system/cpu/cpu0/cpufreq/{{cpuinfo_min_freq,cpuinfo_max_freq}} /sys/class/power_supply/battery/capacity
adb shell touch /sdcard/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Intermediate

REM حقن الملف المطلوب
adb push libmario.so /data/data/com.tencent.ig/lib/libGVoicePlugin.so

REM إعادة تشغيل اللعبة
adb shell monkey -p com.tencent.ig -c android.intent.category.LAUNCHER 1

REM الانتظار لبضع ثوانٍ لضمان فتح اللعبة
timeout /t 10 /nobreak >nul

REM بدء عملية الحقن كل ثانية لمدة دقيقة (60 مرة)
for /L %%i in (1,1,700) do (
    adb push ml /data/data/com.tencent.ig/files/ano_tmp/ano_emu_c2.dat
    timeout /t 1 /nobreak >nul
)

REM تسجيل السجلات
echo[
@echo =============================== LOG ================================
echo[
adb logcat | findstr MRBOOT
color F