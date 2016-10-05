#!/bin/bash
sleep 3
pkill -RTMIN+1 i3blocks
while : ; do
    if [ -n $(acpi_listen -c 1 | grep HEADPHONE > /dev/null) ]; then
        pkill -RTMIN+1 i3blocks
    fi
done
