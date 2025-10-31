@echo off
adb kill-server
adb root
adb shell rm -rf /data/data/com.tencent.ig/cache/*
adb shell rm -rf /data/data/com.tencent.ig/code_cache/*
adb shell rm -rf /data/data/com.tencent.ig/shared_prefs/*
adb shell rm -rf /data/data/com.tencent.ig/databases/*
adb shell rm -rf /data/data/com.tencent.ig/files/.system_android_l2
adb shell chmod 000 /proc/{{cpuinfo,meminfo}} /system/build.prop /sys/devices/system/cpu/cpu0/cpufreq/{{cpuinfo_min_freq,cpuinfo_max_freq}} /sys/class/power_supply/battery/capacity
adb shell touch /sdcard/Android/data/com.tencent.ig/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Intermediate
