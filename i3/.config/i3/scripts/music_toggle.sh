#!/bin/sh
if [ -n "$(nuvolaplayer3ctl track-info state | grep 'playing\|paused')" ]; then
    nuvolaplayer3ctl action toggle-play
else
    mocp -G
fi

exit 0
