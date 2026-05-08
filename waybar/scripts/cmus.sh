#!/bin/bash

status=$(cmus-remote -Q 2>/dev/null)

if [[ -z "$status" ]]; then
    echo " offline"
    exit 0
fi

artist=$(echo "$status" | grep '^tag artist ' | cut -d' ' -f3-)
title=$(echo "$status" | grep '^tag title ' | cut -d' ' -f3-)
state=$(echo "$status" | grep '^status ' | awk '{print $2}')

if [[ "$state" == "playing" ]]; then
    icon=""
else
    icon=""
fi

echo "$icon $artist - $title"
