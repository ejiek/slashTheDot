#!/bin/bash
#scrot /tmp/screenshot.png
#convert /tmp/screenshot.png -blur 0x5 /tmp/screenshotblur.png
#i3lock -i /tmp/screenshotblur.png </dev/null &>/dev/null &
#disown
scrot 'lockbg.png'  -e 'convert -resize 20% -fill "#282828" -colorize 50% -blur 0x1 -resize 500% $f ~/lockbg.png'
convert -gravity center -composite ~/lockbg.png ~/Pictures/Icons/lock.png ~/lockfinal.png
i3lock -u -i ~/lockfinal.png
rm -f ~/lockfinal.png ~/lockbg.png lockbg.png
