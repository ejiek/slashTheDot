#!/usr/bin/env bash

ACPI=$(acpi -b)
CHARGE=$(echo -n "${ACPI}" | egrep -o "[0-9]+%" | sed -e "s,%,,g")
LEVEL=$(( (CHARGE - 1) / 20 ))
FULL="'red'"
ECOLOUR=""
if [ -n "$(echo ${ACPI} | grep Charging)" ]; then
    ECOLOUR="'#90C3D4'"
elif [ -n "$(echo ${ACPI} | grep Full)" ]; then
    FULL="'#8FD989'"
else
    ECOLOUR="'#404040'"
#    [ "${LEVEL}" -eq "0" ] && i3-msg "fullscreen disable"
fi

echo $[ $CHARGE - $[ $LEVEL * 20 ] ]

for i in `seq 0 4`; do
	if [ "$i" -le "$LEVEL" ] && [ $CHARGE -gt 5 ]; then
		if [ "$LEVEL" -eq "$i" ]; then
			Gradient=('#ff0000' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' 'E');
			echo -ne "<span color=#000000> \uf004 </span>"
		else
			echo -ne "<span color=$FULL> \uf004 </span>"
		fi
	else
		echo -ne "<span color=$ECOLOUR> \uf004 </span>"
	fi
done

exit 0
