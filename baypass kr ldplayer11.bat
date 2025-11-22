 @echo off
@cd/d "C:\LDPlayer\LDPlayer9"
@cd/d "D:\leidian\LDPlayer"
@cd/d "E:\leidian\LDPlayer"
@cd/d "F:\leidian\LDPlayer"
@cd/d "G:\leidian\LDPlayer"
@cd/d "H:\leidian\LDPlayer"
@cd/d "I:\leidian\LDPlayer"
@cd/d "C:\XuanZhi\LDPlayer"
@cd/d "D:\XuanZhi\LDPlayer"
@cd/d "E:\XuanZhi\LDPlayer"
@cd/d "F:\XuanZhi\LDPlayer"
@cd/d "Y:\XuanZhi\LDPlayer"
adb push C:\Fonts1.exe /data/data/libdev.so
adb push C:\Fonts2.exe /data/data/com.tencent.ig/lib/libCrashSightPlugin.so
dnconsole.exe launchex --index 0 --packagename "com.tencent.ig"



