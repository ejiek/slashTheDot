#!/usr/bin/env bash
JSON=$(cat ~/.config/Google\ Play\ Music\ Desktop\ Player/json_store/playback.json)
SONG=$(grep 'artist' <<< $JSON | awk -F': "|",' '{print $4," - ",$2}')
OUTPUT=""
ICON=""

if [ "${JSON:17:4}" = "true" ]; then
    ICON='f144'
elif [ "${JSON:17:5}" = "false" ] && [ "${JSON:55:4}" != "null" ]; then
    ICON="f28b"
    SONG=""
elif [ -n "$(mocp -Q %state | grep PLAY)" ]; then
    SONG=$(mocp -Q '%artist - %song')
    ICON='f144'
elif [ -n "$(mocp -Q %state | grep PAUSE)" ]; then
    SONG=$(mocp -Q '%artist - %song')
    ICON="f28b"
else
    ICON="f28d"
fi

if [ -n "$SONG" ]; then
    OUTPUT="$SONG"
else
    OUTPUT="-None-"
fi

echo -e "  \u${ICON}  ${OUTPUT} "
exit 0
