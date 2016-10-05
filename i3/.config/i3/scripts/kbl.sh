#!/bin/bash
correction=0
current=$(cat /sys/class/leds/asus::kbd_backlight/brightness)
[ "$1" == 'up' ] && [ "$current" != '3' ]  && correction=1
[ "$1" == 'down' ] && [ "$current" != '0' ] && correction=-1
new=$((current+correction)) 
[ "$1" == 'off' ] && [ "$current" != '0' ] && new=0
[ $current ==  $new ] && exit 1
eval "echo $new" >> /sys/class/leds/asus::kbd_backlight/brightness
exit 0
