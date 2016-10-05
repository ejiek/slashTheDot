#!/usr/bin/env bash
# vim:ts=4:sw=4:expandtab
core1=$(cat /sys/devices/platform/coretemp.0/hwmon/hwmon2/temp1_input)
core2=$(cat /sys/devices/platform/coretemp.0/hwmon/hwmon2/temp2_input)

temp=$(($core1+$core2))
result=$(($temp/2000))
echo $result

exit 0
