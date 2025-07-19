#!/system/bin/sh
MODDIR=${0%/*}

while true; do boot=$(getprop sys.boot_completed);if [ "$boot" = 1 ]; then

chmod 0644 /sys/class/thermal/thermal_zone0/trip_point_0_temp
echo 999999999 > /sys/class/thermal/thermal_zone0/trip_point_0_temp
chmod 0644 /sys/class/thermal/thermal_zone9/trip_point_0_temp
echo 999999999 > /sys/class/thermal/thermal_zone9/trip_point_0_temp
chmod 0644 /sys/class/thermal/thermal_zone10/trip_point_0_temp
echo 999999999 > /sys/class/thermal/thermal_zone10/trip_point_0_temp

find /sys/devices/virtual/thermal -type f -exec chmod 000 {} +

chmod 0644 /sys/module/workqueue/parameters/power_efficient
echo "N" > /sys/module/workqueue/parameters/power_efficient
chmod 0644 /sys/module/workqueue/parameters/disable_numa
echo "N" > /sys/module/workqueue/parameters/disable_numa

stop thermal_core
stop thermal_manager
stop vendor.thermal-hal-2-0.mtk
stop mi_thermald
stop vendor.thermal-engine
stop vendor.thermal-manager
stop vendor.thermal-hal-2-0
stop vendor.thermal-symlinks
stop vendor.thermal.symlinks
stop thermal_mnt_hal_service
stop vendor.thermal-hal
stop thermal
stop thermald
stop thermalloadalgod
stop thermalservice
stop sec-thermal-1-0
stop debug_pid.sec-thermal-1-0
stop thermal-engine
stop vendor.thermal-hal-1-0
stop android.thermal-hal
stop vendor-thermal-1-0
stop thermal-hal
stop android.thermal-hal

for a in $(getprop|grep thermal|cut -f1 -d]|cut -f2 -d[|grep -F init.svc.|sed 's/init.svc.//');do stop $a;done;for b in $(getprop|grep thermal|cut -f1 -d]|cut -f2 -d[|grep -F init.svc.);do setprop $b stopped;done;for c in $(getprop|grep thermal|cut -f1 -d]|cut -f2 -d[|grep -F init.svc_);do setprop $c "";done
exit;fi;sleep 1;done