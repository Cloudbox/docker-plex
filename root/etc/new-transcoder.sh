#!/bin/bash
marap=$(grep -oP '(?<=-codec:0 )[^ ]*' <<< "$@" | head -1)
if [[ $marap == "mpeg4" ]]; then
     exec /usr/lib/plexmediaserver/Plex\ Transcoder2 "$@"
else
     exec /usr/lib/plexmediaserver/Plex\ Transcoder2 -hwaccel nvdec "$@"
fi
