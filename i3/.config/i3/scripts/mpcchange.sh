#!/bin/bash
sleep 3
pkill -RTMIN+1 i3blocks
while : ; do
    mpc idle player > /dev/null
    #mpc current
    pkill -RTMIN+1 i3blocks
done
